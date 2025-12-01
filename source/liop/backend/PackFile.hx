package liop.backend;

typedef PackFile = {
    name:String,
    ?description:String,

    api_version:Null<Float>,
    ?pack_version:Null<Float>,
}