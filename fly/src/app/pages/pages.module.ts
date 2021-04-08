import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PagesRoutingModule } from './pages-routing.module';
import { IndexComponent } from './index/index.component';
import { LayoutsModule } from '../layouts/layouts.module';
import { ComponentsModule } from '../components/components.module';


@NgModule({
    declarations: [
        IndexComponent
    ],
    imports: [
        CommonModule,
        PagesRoutingModule,
        LayoutsModule,
        ComponentsModule,

    ]
})
export class PagesModule {
}
