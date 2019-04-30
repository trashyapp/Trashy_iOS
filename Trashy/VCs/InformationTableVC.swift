//
//  InformationTableVC.swift
//  Trashy
//
//  Created by Julia Lauten on 26.04.19.
//  Copyright © 2019 Julia Lauten. All rights reserved.
//

import UIKit

let data = [
    ["Braune Tonne - Bio",
     "Die Biotonne bezeichnet einen Behälter aus Kunststoff mit Deckel, in dem die im Haushalt anfallenden biologisch verwertbaren Abfallstoffe entsorgt werden können. Im Gegensatz zur übrigen Abfallentsorgung ist die dort Grünabfuhr genannte Entsorgung je nach Gemeinde extrem unterschiedlich oder sogar gar nicht organisiert. Für die Bereitstellung einer Biotonne wird zumeist von den Entsorgungsunternehmen eine gesonderte Gebühr erhoben."],
    ["Gelbe Tonne - grüner Punkt",
     "In die Gelbe Tonnen / den Gelben Sack gehören ausschließlich Verkaufsverpackungen aus Kunststoff, Metall oder Verbundmaterialien, andere Gegenstände auch aus den gleichen Materialien, z. B. Kunststoffzahnbürsten, Videokassetten, CDs, DVDs oder Einwegrasierer gehören nicht in den gelben Sack. Verpackungen, die über den Gelben Sack bzw. die Gelbe Tonne entsorgt werden (Beispiele): Verpackungen aus Kunststoff, Spülmittelflaschen, Joghurt becher, Plastiktuben, Verpackungen für Körperpflegemittel, Milch-, Saft- und Weinkartons (z. B. Tetra Pak), Plastiktüten, Eisverpackungen, Zahncremetuben etc., Verpackungen aus Verbundstoffen"],
    ["Blaue Tonne - Papier",
     "Altpapier wird in Altpapiersammelcontainern oder in Altpapiertonnen gesammelt, von der Gemeinde beziehungsweise von einem von der Gemeinde beauftragten Betrieb oder von privaten Die Sortierung von Altpapier ist eine wichtige Voraussetzung, um der Papierindustrie die Altpapier-Qualitäten zur Verfügung zu stellen, die benötigt werden. Dabei geht es einerseits darum, die papierfremden Stoffe aus dem Sammelgut zu entfernen, und andererseits darum, definierte Altpapiersorten zusammenzustellen, die von der Papierindustrie nachgefragt werden. Die Sortierung erfolgt manuell oder teilautomatisiert und stellt letztlich die Qualitätssicherung vor Abgabe des gebrauchten Papiers an die Papierfabrik dar."],
    ["Graue Tonne - Restmüll",
     "Als Restmüll wird die Summe aller Abfälle bezeichnet, die wegen Verunreinigung oder Vermischung keiner der getrennt zu sammelnden Abfallfraktionen (Altpapier (Papier, Pappe, Kartonagen), Altmetall, Altglas, Bioabfall, Leichtverpackungen (LVP, Grüner Punkt), Altholz, Elektroschrott, Gefahrstoffe etc.) zugeordnet werden kann. Daher gibt es nur sehr wenige Dinge, die originär zum Restmüll gehören (z. B. Zigarettenkippen, Babywindeln, Hygieneartikel, verschmutzte Tücher, Lappen und Filter, Staub, Asche)."],
    ["Glascontainer - Glas",
     "Glas ist ein wichtiges Material zum Verpacken von Lebensmitteln. Glasrecycling hat in Deutschland Tradition. Bundesweit werden gebrauchte Glasverpackungen in Containern für Grün-, Weiß- und Braunglas gesammelt und der Verwertung zugeführt. Die Recyclingmenge von Glas ist seit Beginn der 70er-Jahre stetig gestiegen. Wurden 1972 rund 3.500 Tonnen Glas verwertet, so waren es Ende der 80er-Jahre bereits 1,3 Millionen Tonnen. Heute sind es über 2 Millionen Tonnen Glas. Die gesammelten Behältergläser gelangen in einen geschlossenen Wertstoffkreislauf und können beliebig oft recycelt werden. Wichtig dabei ist das richtige Trennen nach Farben: Neben Containern für weißes und braunes Glas, stehen die Grünglascontainer für grünes und sonstiges Buntglas zur Verfügung. Seit einigen Jahren geht der Glasverbrauch zu Gunsten von Kunststoffflaschen aus PET zurück. Das leichtere Material wird vor allem immer häufiger für Getränkeflaschen verwendet."],
    ["Pfandautomaten - PET",
     "Polyethylenterephtalat (PET) gehört neben dem ebenfalls weit verbreiteten Polycarbonat (PC) zur Gruppe der Polyester. Zu den Hauptanwendungen für PET zählt die PET-Flasche, die aufgrund der günstigeren Rohstoffkosten  und vor allem auf Grund ihres geringeren Gewichtes zunehmend die Glasflasche vom Markt verdrängt. Recyceltes PET hat im „bottle to bottle“ - Recycling die Lebensmittelzulassung. Eine weitere häufig vertretene Anwendung von PET sind Mikrofasern für Textilien und Vliesstoffe. Häufig werden diese Mikrofasern aus recycelten PET-Einwegflaschen gewonnen."],
]

let colors = ["brown", "yellow", "blue", "grey", "cyan", "blue"]

var myIndex = 0


class ViewCell: UITableViewCell {
    @IBOutlet weak var labelDetail: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
}

class InformationTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewload")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ViewCell
        
        //tableView.register(ViewCell.self, forCellReuseIdentifier: "Cell")
        
        cell.labelTitle?.text = data[indexPath.row][0]
        cell.labelDetail?.text = data[indexPath.row][1]
        print ("ja")
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "InfoInhalt", sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
