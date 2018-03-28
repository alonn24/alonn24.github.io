import { Component, Input } from '@angular/core';

@Component({
  selector: 'section-details',
  templateUrl: './section-details.component.html',
  styleUrls: ['./section-details.component.scss']
})
export class SectionDetailsComponent {
  @Input() details;

  toggleBullets($event, item) {
    $event.preventDefault();
    item.show = !item.show;
  }

  shouldShowBullets = item => item.show === true;
}
