import { Component, Output, EventEmitter } from '@angular/core';
import { Education, Experience } from '../data/cv'

@Component({
  selector: 'welcome-section',
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.scss']
})
export class WelcomeComponent {
  @Output() goto = new EventEmitter<string>();

  get experience() {
    return Experience;
  }

  get education() {
    return Education;
  }

  aboutMe = () => this.goto.emit();
}
