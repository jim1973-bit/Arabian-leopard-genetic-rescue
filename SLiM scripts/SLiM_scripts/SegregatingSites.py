import msprime, pyslim, os.path, tskit
gens = ["Gen602001", "Gen602002", "Gen602003", "Gen602004", "Gen602005", "Gen602006", "Gen602007", "Gen602008", "Gen602009", "Gen602010", "Gen602011", "Gen602012", "Gen602013", "Gen602014", "Gen602015", "Gen602016", "Gen602017", "Gen602018", "Gen602019", "Gen602020", "Gen602021", "Gen602022", "Gen602023", "Gen602024"]
for i in gens:
    seeds = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82",     "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
    of = open("Wild_Pi_"+i+".txt", "x")
    of.write("Seed"+"\t"+"Pi"+"\n")
    for j in seeds:
        filename = "OpTree_Seed"+j+"_"+i+"_overlaid.trees"
        if os.path.isfile(filename):
            ts = tskit.load(filename).simplify()
            pop_nodes = [ts.samples(population=p) for p in range(ts.num_populations)]
            Pi = str(ts.segregating_sites(pop_nodes[0]))
            of = open("Wild_Pi_"+i+".txt", "a")
            of.write(j+"\t"+Pi+"\n")
            of.close()
