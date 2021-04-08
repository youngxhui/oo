import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavComponent } from './components/nav/nav.component';
import { NavItemComponent } from './components/nav-item/nav-item.component';
import { DefaultComponent } from './layouts/default/default.component';
import { BlankComponent } from './layouts/blank/blank.component';

@NgModule({
    declarations: [
        AppComponent,
    ],
    imports: [
        BrowserModule,
        AppRoutingModule
    ],
    providers: [],

    bootstrap: [AppComponent]
})
export class AppModule {
}
