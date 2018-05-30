import { TestBed, ComponentFixture, async } from '@angular/core/testing';
import { WelcomeComponent } from "./welcome.component";

describe('WelcomeComponent', () => {
  let fixture: ComponentFixture<WelcomeComponent>;
  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [
        WelcomeComponent
      ],
    }).compileComponents();
    fixture = TestBed.createComponent(WelcomeComponent);
  }));

  it('should create a welcome component', async(() => {
    const welcomeComponent = <WelcomeComponent>fixture.debugElement.componentInstance;
    let dispatched = false;
    welcomeComponent.goto.subscribe($event => dispatched = true);
    fixture.debugElement.nativeElement.querySelector('a').click();
    expect(dispatched).toBeTruthy();
  }));
});
