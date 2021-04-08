import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BlankComponent } from './blank/blank.component';
import { DefaultComponent } from './default/default.component';

@NgModule({
    declarations: [
        BlankComponent,
        DefaultComponent
    ],
    imports: [
        CommonModule,
    ],


    exports: [
        DefaultComponent
    ]
})
export class LayoutsModule { }
