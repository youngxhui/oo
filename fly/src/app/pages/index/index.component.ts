import { Component, OnInit } from '@angular/core';
import { GrpcClient } from '@ngx-grpc/common';
import { Status, Tool } from '../../../proto/tool.pb';
import { UserSrvClient } from '../../../proto/login.pbsc';
import { UserInfo } from '../../../proto/login.pb';
import { Result } from 'src/proto/base.pb';

interface Person {
    key: string;
    name: string;
    age: number;
    address: string;
}

@Component({
    selector: 'app-index',
    templateUrl: './index.component.html',
    styleUrls: ['./index.component.less']
})
export class IndexComponent implements OnInit {

    tools: Tool[] = new Array<Tool>();
    status = [Status.Health, Status.Damage, Status.Waring];

    constructor(private client: UserSrvClient) {
    }

    grpcTest(): void {
        const request = new UserInfo();
        request.device = 'web';
        request.password = '123';
        request.username = '123';
        this.client.login(request).subscribe(
            (response: Result) => console.log(response.toJSON())
        );
    }

    ngOnInit(): void {
        for (let i = 0; i < 12; i++) {
            const tool = new Tool();
            tool.id = i;
            tool.machineId = i;
            tool.status = this.status[i % 3];
            this.tools.push(tool);
        }
    }

}
