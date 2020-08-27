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
    (name: "焦糖巧克力千层蛋糕", des: "能量约油条1根", cate: "McCafé 糕点", cateIndex: 10,
     calories: 266, pro: 5.7, fat: 12, carbo: 33.2, sodium: 90, calcium: 53)

printStr(with: rawStr)
