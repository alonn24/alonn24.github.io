import { NO_ERRORS_SCHEMA } from "@angular/core";
import { TestBed, ComponentFixture, async } from '@angular/core/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  let fixture: ComponentFixture<AppComponent>;
  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [
        RouterTestingModule
      ],
      declarations: [
        AppComponent
      ],
      schemas: [NO_ERRORS_SCHEMA]
    }).compileComponents();
    fixture = TestBed.createComponent(AppComponent)
  }));

  it(`should have have sections`, async(() => {
    const app = fixture.debugElement.componentInstance;
    expect(app.sections).toBeTruthy();
  }));

  it('should render app', async(() => {
    // fixture.detectChanges();
    const compiled = fixture.debugElement.nativeElement;
    expect(compiled.querySelector('welcome-section')).toBeTruthy();
    expect(compiled.querySelector('resume')).toBeTruthy();
    expect(compiled.querySelector('app-footer')).toBeTruthy();
  }));
});
