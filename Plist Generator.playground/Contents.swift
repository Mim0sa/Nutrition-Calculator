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
    (name: "冰露包装饮用水", des: "能量约清水1杯", cate: "饮料", cateIndex: 21,
     calories: 0, pro: 0, fat: 0, carbo: 0, sodium: 0, calcium: 0)

printStr(with: rawStr)
