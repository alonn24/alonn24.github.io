import { Component } from '@angular/core';
import { Education, Experience } from './data/cv'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  sections = [{
    title: 'Experience',
    details: Experience
  }, {
    title: 'Education',
    details: Education
  }];

  goto(selector) {
    document.querySelector(selector).scrollIntoView({
      behavior: 'smooth'
    });
  }
}
