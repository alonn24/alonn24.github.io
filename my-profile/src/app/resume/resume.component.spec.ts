import { Component, ViewChild } from '@angular/core';
import { TestBed, ComponentFixture, async } from '@angular/core/testing';
import { ResumeComponent } from "./resume.component";

@Component({
  selector: `resume-test-component`,
  template: `<resume [sections]="sections"></resume>`
})
class ResumeTestComponent {
  @ViewChild(ResumeComponent)
  resumeComponent: ResumeComponent;
}

describe('ResumeComponent', () => {
  let fixture: ComponentFixture<ResumeTestComponent>;
  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [
        ResumeComponent,
        ResumeTestComponent
      ],
    }).compileComponents();
    fixture = TestBed.createComponent(ResumeTestComponent);
  }));

  it('should create a resume component', async(() => {
    const ResumeTestComponent = fixture.debugElement.componentInstance;
    expect(ResumeTestComponent.resumeComponent).toBeTruthy();
  }));

  it('should render sections', async(() => {
    const ResumeTestComponent = fixture.debugElement.componentInstance;
    ResumeTestComponent.sections = [{
      title: 'Title',
      details: [{ title: 'item title', content: ['bullet 1', 'bullet 2'] }]
    }];

    expect(fixture.nativeElement.querySelectorAll('li').length).toBe(0);
    fixture.detectChanges();
    expect(fixture.nativeElement.querySelectorAll('li')[0].innerText).toBe('bullet 1');
    expect(fixture.nativeElement.querySelectorAll('li')[1].innerText).toBe('bullet 2');
  }));
});
