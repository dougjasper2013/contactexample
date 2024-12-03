import { NgModule } from '@angular/core';

import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { AboutComponent } from './about/about.component';

import { RouterModule } from '@angular/router';
import { ContactComponent } from './contact/contact.component';

@NgModule({
  declarations: [
    AppComponent,
    AboutComponent,
    ContactComponent
  ],
  imports: [
    BrowserModule, 
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: "contact", component: ContactComponent },
      { path: "about", component: AboutComponent },
      { path: "**", redirectTo: "/contact" }
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }