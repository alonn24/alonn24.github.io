import { Component } from '@angular/core';
import { Social } from "../data/social";

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class AppFooter {
  get social() {
    return Social;
  }
}
