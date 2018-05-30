import { Component, Input } from '@angular/core';

@Component({
  selector: 'section-details',
  templateUrl: './section-details.component.html',
  styleUrls: ['./section-details.component.scss']
})
export class SectionDetailsComponent {
  @Input() details;
  selectedDetail;

  mouseleave() {
    this.selectedDetail = null;
  }

  mouseenter(item) {
    this.selectedDetail = item;
  }

  elevation(item) {
    return item == this.selectedDetail ? 5 : 1;
  }
}
