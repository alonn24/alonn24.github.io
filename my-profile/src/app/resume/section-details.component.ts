import { Component, Input } from '@angular/core';

@Component({
  selector: 'section-details',
  templateUrl: './section-details.component.html',
  styleUrls: ['./section-details.component.scss']
})
export class SectionDetailsComponent {
  @Input() details;
  displayedItem;

  ngOnInit() {
    this.displayedItem = this.details[0];
  }

  choose(item) {
    this.displayedItem = item;
  }

  toggleBullets($event, item) {
    $event.preventDefault();
    item.show = !item.show;
  }

  shouldShowBullets = item => item.show === true;
}
