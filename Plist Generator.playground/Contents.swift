import UIKit

typealias Model = (name: String, des: String, cate: String,
    cateIndex: Int, calories: Int, pro: Double, fat: Double,
    carbo: Double, sodium: Int, calcium: Int)
func printStr(with model: Model) {
    let str = """
    <dict>
        <key>name</key>
        <string>\(model.name)</string>
        <key>description</key>
        <string>\(model.des)</string>
        <key>categoryType</key>
        <string>\(model.cate)</string>
        <key>categoryIndex</key>
        <integer>\(model.cateIndex)</integer>
        <key>nutritions</key>
        <dict>
            <key>calories</key>
            <integer>\(model.calories)</integer>
            <key>protein</key>
            <real>\(model.pro)</real>
            <key>fat</key>
            <real>\(model.fat)</real>
            <key>carbohydrate</key>
            <real>\(model.carbo)</real>
            <key>sodium</key>
            <integer>\(model.sodium)</integer>
            <key>calcium</key>
            <integer>\(model.calcium)</integer>
        </dict>
    </dict>
    """
    print(str)
}

let rawStr: Model =
    (name: "鲜美烟肉早晨全餐", des: "能量约桔子7个", cate: "早餐", cateIndex: 17,
     calories: 474, pro: 27.2, fat: 20.5, carbo: 42.4, sodium: 1117, calcium: 196)

printStr(with: rawStr)
