function sky -d "Go into my work folder"
    cd ~/Sky
end

function billingCopyDist -d 'Copy dist folder and index.d.ts from sky-it-http-manager to my-account-billing'
    cp -r $SKY_IT_HTTP_MANAGER/dist $BILLING/node_modules/sky-it-http-manager
    cp $SKY_IT_HTTP_MANAGER/index.d.ts $BILLING/node_modules/sky-it-http-manager/index.d.ts
    print_success "Done"
end

function accountCopyDist -d 'Copy dist folder and index.d.ts from sky-it-http-manager to my-account-poc'
    cp -r $SKY_IT_HTTP_MANAGER/dist $MY_ACCOUNT_POC/node_modules/sky-it-http-manager
    cp $SKY_IT_HTTP_MANAGER/index.d.ts $MY_ACCOUNT_POC/node_modules/sky-it-http-manager/index.d.ts
    print_success "Done"
end
