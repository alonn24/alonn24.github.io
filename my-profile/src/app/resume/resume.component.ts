import { Component, Input, ViewChildren, QueryList } from '@angular/core';

@Component({
  selector: 'resume',
  templateUrl: './resume.component.html',
  styleUrls: ['./resume.component.scss']
})
export class ResumeComponent {
  @Input() sections;
  @ViewChildren('me') mes: QueryList<any>;

  constructor() {
    window.addEventListener('scroll', e => {
      this.mes.forEach(me => this.isFaded(me.nativeElement));
    });
  }

  ngAfterViewInit() {
    this.mes.forEach(me => this.isFaded(me.nativeElement));
  }

  isFaded(nativeElement) {
    if (nativeElement.classList.contains('faded')) {
      return;
    }
    var bounding = nativeElement.getBoundingClientRect();
    let windowHeight = (window.innerHeight || document.documentElement.clientHeight);
    if (bounding.bottom <= windowHeight) {
      nativeElement.classList.add('faded')
    }
  }
}
