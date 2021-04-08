import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-nav-item',
    templateUrl: './nav-item.component.html',
    styleUrls: ['./nav-item.component.css']
})
export class NavItemComponent implements OnInit {

    @Input()
    href: string;

    @Input()
    isActive = false;

    constructor() {
    }

    ngOnInit(): void {
    }

}
