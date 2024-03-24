import sys
sys.path.append('../..')

from fastapi import APIRouter, Body, Request, Response, HTTPException, status
from fastapi.encoders import jsonable_encoder
from typing import List
from app.models.main import Book, BookUpdate


router = APIRouter()


@router.post("/", response_description="Create a new book", status_code=status.HTTP_201_CREATED, response_model=Book)
def create_book(request: Request, book: Book = Body(...)):
    """
    Create a new book in the database
    Use the Book model to validate both the data passed in the request body and the response we sent back
    """
    book = jsonable_encoder(book)
    books_collection = request.app.database["books"]
    new_book = books_collection.insert_one(book)
    created_book = books_collection.find_one(
        {"_id": new_book.inserted_id}
    )

    return created_book


@router.get("/", response_description="List all books", response_model=List[Book])
def list_books(request: Request):
    books = list(request.app.database["books"].find(limit=100))
    return books


@router.get("/{id}", response_description="Get a single book by id", response_model=Book)
def find_book(id: str, request: Request):
    if (book := request.app.database["books"].find_one({"_id": id})) is not None:
        return book
    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Book with ID {id} not found")


@router.put("/{id}", response_description="Update a book", response_model=Book)
def update_book(id: str, request: Request, book: BookUpdate = Body(...)):
    # Filter to update only non null fields
    book = {k: v for k, v in book.dict().items() if v is not None}
    # Update only if at least one field is present
    if len(book) >= 1:
        update_result = request.app.database["books"].update_one(
            {"_id": id}, {"$set": book}
        )

        # Could not find the book
        if update_result.modified_count == 0:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Book with ID {id} not found")

    if (
        existing_book := request.app.database["books"].find_one({"_id": id})
    ) is not None:
        return existing_book

    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Book with ID {id} not found")


@router.delete("/{id}", response_description="Delete a book")
def delete_book(id: str, request: Request, response: Response):
    delete_result = request.app.database["books"].delete_one({"_id": id})

    if delete_result.deleted_count == 1:
        response.status_code = status.HTTP_204_NO_CONTENT
        return response

    raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=f"Book with ID {id} not found")
