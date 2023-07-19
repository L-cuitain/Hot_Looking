module.exports.getHcId = (category,count) => {
    let hcId = '';
    switch(category){
        case "news":
            if(count.toString().length === 1){
                hcId = `N00${count+1}`
            }else if(count.toString().length === 2){
                hcId = `N0${count+1}`
            }else{
                hcId = `N${count+1}`
            }
            break;
        case "articles":
            if(count.toString().length === 1){
                hcId = `A00${count+1}`
            }else if(count.toString().length === 2){
                hcId = `A0${count+1}`
            }else{
                hcId = `A${count+1}`
            }
            break;
        case "videos":
            if(count.toString().length === 1){
                hcId = `V00${count+1}`
            }else if(count.toString().length === 2){
                hcId = `V0${count+1}`
            }else{
                hcId = `V${count+1}`
            }
            break;
    }
    return hcId;
}