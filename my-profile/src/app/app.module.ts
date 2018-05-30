import { BrowserModule } from '@angular/platform-browser';
import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';

import { AppComponent } from './app.component';
import { AppFooter } from "./footer/footer.component";
import { WelcomeComponent } from "./welcome/welcome.component";
import { ResumeComponent } from "./resume/resume.component";
import { SectionDetailsComponent } from "./resume/section-details.component";

@NgModule({
  declarations: [
    AppComponent,
    AppFooter,
    WelcomeComponent,
    ResumeComponent,
    SectionDetailsComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'alonn24-profile' }),
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
