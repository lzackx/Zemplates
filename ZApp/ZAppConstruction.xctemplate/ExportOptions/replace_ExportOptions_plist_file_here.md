|key|名称|类型|说明|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|provisioningProfiles|调试证书列表|Dictionary|App的bundle ID作为key</br>mobileprovision的文件名作为value(String)</br>注意还包括Extension APP的配置|
|methond|导出包类型|String|值：app-store</br>ad-hoc</br>package</br>enterprise</br>development</br>developer-id</br>mac-application|
|teamID|开发团体Id|String|可在keychain或者登录开发者中心网站中查看</br>企业账号需要移除|
|compileBitcode|项目是否支持bitcode|Bool类型|xcodebuild -help 查看|
