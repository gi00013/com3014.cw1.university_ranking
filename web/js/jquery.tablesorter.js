/*!
 * TableSorter 2.9.1 min - Client-side table sorting with ease!
 * Copyright (c) 2007 Christian Bach
 */
!function (f) {
    f.extend({tablesorter: new function () {
            function d(c) {
                "undefined" !== typeof console && "undefined" !== typeof console.log ? console.log(c) : alert(c)
            }
            function w(c, b) {
                d(c + " (" + ((new Date).getTime() - b.getTime()) + "ms)")
            }
            function r(c, b, a) {
                if (!b)
                    return"";
                var e = c.config, d = e.textExtraction, m = "", m = "simple" === d ? e.supportsTextContent ? b.textContent : f(b).text() : "function" === typeof d ? d(b, c, a) : "object" === typeof d && d.hasOwnProperty(a) ? d[a](b, c, a) : e.supportsTextContent ? b.textContent : f(b).text();
                return f.trim(m)
            }
            function j(c) {
                var b = c.config, a = b.$tbodies = b.$table.children("tbody:not(." + b.cssInfoBlock + ")"), e, t, m, p, k, n, h = "";
                if (0 === a.length)
                    return b.debug ? d("*Empty table!* Not building a parser cache") : "";
                a = a[0].rows;
                if (a[0]) {
                    e = [];
                    t = a[0].cells.length;
                    for (m = 0; m < t; m++) {
                        p = b.$headers.filter(":not([colspan])");
                        p = p.add(b.$headers.filter('[colspan="1"]')).filter('[data-column="' + m + '"]:last');
                        k = b.headers[m];
                        n = g.getParserById(g.getData(p, k, "sorter"));
                        b.empties[m] = g.getData(p, k, "empty") || b.emptyTo || (b.emptyToBottom ? "bottom" : "top");
                        b.strings[m] = g.getData(p, k, "string") || b.stringTo || "max";
                        if (!n)
                            a:{
                                p = c;
                                k = a;
                                n = -1;
                                for (var f = m, l = void 0, w = g.parsers.length, F = !1, C = "", l = !0; "" === C && l; )
                                    n++, k[n] ? (F = k[n].cells[f], C = r(p, F, f), p.config.debug && d("Checking if value was empty on row " + n + ", column: " + f + ': "' + C + '"')) : l = !1;
                                for (; 0 <= --w; )
                                    if ((l = g.parsers[w]) && "text" !== l.id && l.is && l.is(C, p, F)) {
                                        n = l;
                                        break a
                                    }
                                n = g.getParserById("text")
                            }
                        b.debug && (h += "column:" + m + "; parser:" + n.id + "; string:" + b.strings[m] + "; empty: " + b.empties[m] + "\n");
                        e.push(n)
                    }
                }
                b.debug && d(h);
                b.parsers = e
            }
            function s(c) {
                var b = c.tBodies, a = c.config, e, t, m = a.parsers, p, k, n, h, q, l, G, j = [];
                a.cache = {};
                if (!m)
                    return a.debug ? d("*Empty table!* Not building a cache") : "";
                a.debug && (G = new Date);
                a.showProcessing && g.isProcessing(c, !0);
                for (h = 0; h < b.length; h++)
                    if (a.cache[h] = {row: [], normalized: []}, !f(b[h]).hasClass(a.cssInfoBlock)) {
                        e = b[h] && b[h].rows.length || 0;
                        t = b[h].rows[0] && b[h].rows[0].cells.length || 0;
                        for (k = 0; k < e; ++k)
                            if (q = f(b[h].rows[k]), l = [], q.hasClass(a.cssChildRow))
                                a.cache[h].row[a.cache[h].row.length - 1] = a.cache[h].row[a.cache[h].row.length - 1].add(q);
                            else {
                                a.cache[h].row.push(q);
                                for (n = 0; n < t; ++n)
                                    if (p = r(c, q[0].cells[n], n), p = m[n].format(p, c, q[0].cells[n], n), l.push(p), "numeric" === (m[n].type || "").toLowerCase())
                                        j[n] = Math.max(Math.abs(p), j[n] || 0);
                                l.push(a.cache[h].normalized.length);
                                a.cache[h].normalized.push(l)
                            }
                        a.cache[h].colMax = j
                    }
                a.showProcessing && g.isProcessing(c);
                a.debug && w("Building cache for " + e + " rows", G)
            }
            function v(c, b) {
                var a = c.config, e = c.tBodies, d = [], m = a.cache, p, k, n, h, q, l, j, r, C, s, v;
                if (m[0]) {
                    a.debug && (v = new Date);
                    for (r = 0; r < e.length; r++)
                        if (p = f(e[r]), p.length && !p.hasClass(a.cssInfoBlock)) {
                            q = g.processTbody(c, p, !0);
                            p = m[r].row;
                            k = m[r].normalized;
                            h = (n = k.length) ? k[0].length - 1 : 0;
                            for (l = 0; l < n; l++)
                                if (s = k[l][h], d.push(p[s]), !a.appender || !a.removeRows) {
                                    C = p[s].length;
                                    for (j = 0; j < C; j++)
                                        q.append(p[s][j])
                                }
                            g.processTbody(c, q, !1)
                        }
                    a.appender && a.appender(c, d);
                    a.debug && w("Rebuilt table", v);
                    b || g.applyWidget(c);
                    f(c).trigger("sortEnd", c)
                }
            }
            function z(c) {
                var b = [], a = {}, e = 0, t = f(c).find("thead:eq(0), tfoot").children("tr"), m, p, k, n, h, q, l, j, r, s;
                for (m = 0; m < t.length; m++) {
                    h = t[m].cells;
                    for (p = 0; p < h.length; p++) {
                        n = h[p];
                        q = n.parentNode.rowIndex;
                        l = q + "-" + n.cellIndex;
                        j = n.rowSpan || 1;
                        r = n.colSpan || 1;
                        "undefined" === typeof b[q] && (b[q] = []);
                        for (k = 0; k < b[q].length + 1; k++)
                            if ("undefined" === typeof b[q][k]) {
                                s = k;
                                break
                            }
                        a[l] = s;
                        e = Math.max(s, e);
                        f(n).attr({"data-column": s});
                        for (k = q; k < q + j; k++) {
                            "undefined" === typeof b[k] && (b[k] = []);
                            l = b[k];
                            for (n = s; n < s + r; n++)
                                l[n] = "x"
                        }
                    }
                }
                c.config.columns = e;
                var v, u, z, B, A, y, D, x = c.config;
                x.headerList = [];
                x.headerContent = [];
                x.debug && (D = new Date);
                B = x.cssIcon ? '<i class="' + x.cssIcon + '"></i>' : "";
                x.$headers = f(c).find(x.selectorHeaders).each(function (c) {
                    u = f(this);
                    v = x.headers[c];
                    x.headerContent[c] = this.innerHTML;
                    A = x.headerTemplate.replace(/\{content\}/g, this.innerHTML).replace(/\{icon\}/g, B);
                    x.onRenderTemplate && (z = x.onRenderTemplate.apply(u, [c, A])) && "string" === typeof z && (A = z);
                    this.innerHTML = '<div class="tablesorter-header-inner">' + A + "</div>";
                    x.onRenderHeader && x.onRenderHeader.apply(u, [c]);
                    this.column = a[this.parentNode.rowIndex + "-" + this.cellIndex];
                    var b = g.getData(u, v, "sortInitialOrder") || x.sortInitialOrder;
                    this.order = /^d/i.test(b) || 1 === b ? [1, 0, 2] : [0, 1, 2];
                    this.count = -1;
                    this.lockedOrder = !1;
                    y = g.getData(u, v, "lockedOrder") || !1;
                    "undefined" !== typeof y && !1 !== y && (this.order = this.lockedOrder = /^d/i.test(y) || 1 === y ? [1, 1, 1] : [0, 0, 0]);
                    u.addClass(x.cssHeader);
                    x.headerList[c] = this;
                    u.parent().addClass(x.cssHeaderRow)
                });
                E(c);
                x.debug && (w("Built headers:", D), d(x.$headers))
            }
            function A(c, b, a) {
                var e = f(c);
                e.find(c.config.selectorRemove).remove();
                j(c);
                s(c);
                D(e, b, a)
            }
            function E(c) {
                var b, a = c.config;
                a.$headers.each(function (c, d) {
                    b = "false" === g.getData(d, a.headers[c], "sorter");
                    d.sortDisabled = b;
                    f(d)[b ? "addClass" : "removeClass"]("sorter-false")
                })
            }
            function y(c) {
                var b, a, e, d = c.config, m = d.sortList, p = [d.cssAsc, d.cssDesc], k = f(c).find("tfoot tr").children().removeClass(p.join(" "));
                d.$headers.removeClass(p.join(" "));
                e = m.length;
                for (b = 0; b < e; b++)
                    if (2 !== m[b][1] && (c = d.$headers.not(".sorter-false").filter('[data-column="' + m[b][0] + '"]' + (1 === e ? ":last" : "")), c.length))
                        for (a = 0; a < c.length; a++)
                            c[a].sortDisabled || (c.eq(a).addClass(p[m[b][1]]), k.length && k.filter('[data-column="' + m[b][0] + '"]').eq(a).addClass(p[m[b][1]]))
            }
            function B(c) {
                var b = 0, a = c.config, e = a.sortList, d = e.length, m = c.tBodies.length, p, k, g, h, q, l, j, r, s;
                if (!a.serverSideSorting && a.cache[0]) {
                    a.debug && (p = new Date);
                    for (g = 0; g < m; g++)
                        q = a.cache[g].colMax, s = (l = a.cache[g].normalized) && l[0] ? l[0].length - 1 : 0, l.sort(function (m, p) {
                            for (k = 0; k < d; k++) {
                                h = e[k][0];
                                r = e[k][1];
                                j = /n/i.test(a.parsers && a.parsers[h] ? a.parsers[h].type || "" : "") ? "Numeric" : "Text";
                                j += 0 === r ? "" : "Desc";
                                /Numeric/.test(j) && a.strings[h] && (b = "boolean" === typeof a.string[a.strings[h]] ? (0 === r ? 1 : -1) * (a.string[a.strings[h]] ? -1 : 1) : a.strings[h] ? a.string[a.strings[h]] || 0 : 0);
                                var g = f.tablesorter["sort" + j](c, m[h], p[h], h, q[h], b);
                                if (g)
                                    return g
                            }
                            return m[s] - p[s]
                        });
                    a.debug && w("Sorting on " + e.toString() + " and dir " + r + " time", p)
                }
            }
            function H(c, b) {
                c.trigger("updateComplete");
                "function" === typeof b && b(c[0])
            }
            function D(c, b, a) {
                !1 !== b && !c[0].isProcessing ? c.trigger("sorton", [c[0].config.sortList, function () {
                        H(c, a)
                    }]) : H(c, a)
            }
            function I(c) {
                var b = c.config, a = f(c), e, d;
                b.$headers.find(b.selectorSort).add(b.$headers.filter(b.selectorSort)).unbind("mousedown.tablesorter mouseup.tablesorter sort.tablesorter").bind("mousedown.tablesorter mouseup.tablesorter sort.tablesorter", function (a, e) {
                    var k = (this.tagName.match("TH|TD") ? f(this) : f(this).parents("th, td").filter(":last"))[0];
                    if (1 !== (a.which || a.button) && "sort" !== a.type)
                        return!1;
                    if ("mousedown" === a.type)
                        return d = (new Date).getTime(), "INPUT" === a.target.tagName ? "" : !b.cancelSelection;
                    if (!0 !== e && 250 < (new Date).getTime() - d)
                        return!1;
                    b.delayInit && !b.cache && s(c);
                    if (!k.sortDisabled) {
                        var n, h, q, l = c.config, j = !a[l.sortMultiSortKey], r = f(c);
                        r.trigger("sortStart", c);
                        k.count = a[l.sortResetKey] ? 2 : (k.count + 1) % (l.sortReset ? 3 : 2);
                        l.sortRestart && (h = k, l.$headers.each(function () {
                            if (this !== h && (j || !f(this).is("." + l.cssDesc + ",." + l.cssAsc)))
                                this.count = -1
                        }));
                        h = k.column;
                        if (j) {
                            l.sortList = [];
                            if (null !== l.sortForce) {
                                n = l.sortForce;
                                for (q = 0; q < n.length; q++)
                                    n[q][0] !== h && l.sortList.push(n[q])
                            }
                            n = k.order[k.count];
                            if (2 > n && (l.sortList.push([h, n]), 1 < k.colSpan))
                                for (q = 1; q < k.colSpan; q++)
                                    l.sortList.push([h + q, n])
                        } else if (l.sortAppend && 1 < l.sortList.length && g.isValueInArray(l.sortAppend[0][0], l.sortList) && l.sortList.pop(), g.isValueInArray(h, l.sortList))
                            for (q = 0; q < l.sortList.length; q++)
                                k = l.sortList[q], n = l.headerList[k[0]], k[0] === h && (k[1] = n.order[n.count], 2 === k[1] && (l.sortList.splice(q, 1), n.count = -1));
                        else if (n = k.order[k.count], 2 > n && (l.sortList.push([h, n]), 1 < k.colSpan))
                            for (q = 1; q < k.colSpan; q++)
                                l.sortList.push([h + q, n]);
                        if (null !== l.sortAppend) {
                            n = l.sortAppend;
                            for (q = 0; q < n.length; q++)
                                n[q][0] !== h && l.sortList.push(n[q])
                        }
                        r.trigger("sortBegin", c);
                        setTimeout(function () {
                            y(c);
                            B(c);
                            v(c)
                        }, 1)
                    }
                });
                b.cancelSelection && b.$headers.each(function () {
                    this.onselectstart = function () {
                        return!1
                    }
                });
                a.unbind("sortReset update updateRows updateCell updateAll addRows sorton appendCache applyWidgetId applyWidgets refreshWidgets destroy mouseup mouseleave ".split(" ").join(".tablesorter ")).bind("sortReset.tablesorter", function (a) {
                    a.stopPropagation();
                    b.sortList = [];
                    y(c);
                    B(c);
                    v(c)
                }).bind("updateAll.tablesorter", function (a, b, e) {
                    a.stopPropagation();
                    g.restoreHeaders(c);
                    z(c);
                    I(c);
                    A(c, b, e)
                }).bind("update.tablesorter updateRows.tablesorter", function (a, b, e) {
                    a.stopPropagation();
                    E(c);
                    A(c, b, e)
                }).bind("updateCell.tablesorter", function (e, d, g, n) {
                    e.stopPropagation();
                    a.find(b.selectorRemove).remove();
                    var h, q, l;
                    h = a.find("tbody");
                    e = h.index(f(d).parents("tbody").filter(":last"));
                    var t = f(d).parents("tr").filter(":last");
                    d = f(d)[0];
                    h.length && 0 <= e && (q = h.eq(e).find("tr").index(t), l = d.cellIndex, h = b.cache[e].normalized[q].length - 1, b.cache[e].row[c.config.cache[e].normalized[q][h]] = t, b.cache[e].normalized[q][l] = b.parsers[l].format(r(c, d, l), c, d, l), D(a, g, n))
                }).bind("addRows.tablesorter", function (d, g, k, f) {
                    d.stopPropagation();
                    var h = g.filter("tr").length, t = [], l = g[0].cells.length, w = a.find("tbody").index(g.closest("tbody"));
                    b.parsers || j(c);
                    for (d = 0; d < h; d++) {
                        for (e = 0; e < l; e++)
                            t[e] = b.parsers[e].format(r(c, g[d].cells[e], e), c, g[d].cells[e], e);
                        t.push(b.cache[w].row.length);
                        b.cache[w].row.push([g[d]]);
                        b.cache[w].normalized.push(t);
                        t = []
                    }
                    D(a, k, f)
                }).bind("sorton.tablesorter", function (b, e, d, g) {
                    b.stopPropagation();
                    a.trigger("sortStart", this);
                    var h, t, l, j = c.config;
                    b = e || j.sortList;
                    j.sortList = [];
                    f.each(b, function (a, c) {
                        h = [parseInt(c[0], 10), parseInt(c[1], 10)];
                        if (l = j.headerList[h[0]])
                            j.sortList.push(h), t = f.inArray(h[1], l.order), l.count = 0 <= t ? t : h[1] % (j.sortReset ? 3 : 2)
                    });
                    y(c);
                    B(c);
                    v(c, g);
                    "function" === typeof d && d(c)
                }).bind("appendCache.tablesorter", function (a, b, e) {
                    a.stopPropagation();
                    v(c, e);
                    "function" === typeof b && b(c)
                }).bind("applyWidgetId.tablesorter", function (a, e) {
                    a.stopPropagation();
                    g.getWidgetById(e).format(c, b, b.widgetOptions)
                }).bind("applyWidgets.tablesorter", function (a, b) {
                    a.stopPropagation();
                    g.applyWidget(c, b)
                }).bind("refreshWidgets.tablesorter", function (a, b, e) {
                    a.stopPropagation();
                    g.refreshWidgets(c, b, e)
                }).bind("destroy.tablesorter", function (a, b, e) {
                    a.stopPropagation();
                    g.destroy(c, b, e)
                })
            }
            var g = this;
            g.version = "2.9.1";
            g.parsers = [];
            g.widgets = [];
            g.defaults = {theme: "default", widthFixed: !1, showProcessing: !1, headerTemplate: "{content}", onRenderTemplate: null, onRenderHeader: null, cancelSelection: !0, dateFormat: "mmddyyyy", sortMultiSortKey: "shiftKey", sortResetKey: "ctrlKey", usNumberFormat: !0, delayInit: !1, serverSideSorting: !1, headers: {}, ignoreCase: !0, sortForce: null, sortList: [], sortAppend: null, sortInitialOrder: "asc", sortLocaleCompare: !1, sortReset: !1, sortRestart: !1, emptyTo: "bottom", stringTo: "max", textExtraction: "simple", textSorter: null, widgets: [], widgetOptions: {zebra: ["even", "odd"]}, initWidgets: !0, initialized: null, tableClass: "tablesorter", cssAsc: "tablesorter-headerAsc", cssChildRow: "tablesorter-childRow", cssDesc: "tablesorter-headerDesc", cssHeader: "tablesorter-header", cssHeaderRow: "tablesorter-headerRow", cssIcon: "tablesorter-icon", cssInfoBlock: "tablesorter-infoOnly", cssProcessing: "tablesorter-processing", selectorHeaders: "> thead th, > thead td", selectorSort: "th, td", selectorRemove: ".remove-me", debug: !1, headerList: [], empties: {}, strings: {}, parsers: []};
            g.benchmark = w;
            g.construct = function (c) {
                return this.each(function () {
                    if (!this.tHead || 0 === this.tBodies.length || !0 === this.hasInitialized)
                        return this.config && this.config.debug ? d("stopping initialization! No thead, tbody or tablesorter has already been initialized") : "";
                    var b = f(this), a = this, e, t = "", m = f.metadata;
                    a.hasInitialized = !1;
                    a.isProcessing = !0;
                    a.config = {};
                    e = f.extend(!0, a.config, g.defaults, c);
                    f.data(a, "tablesorter", e);
                    e.debug && f.data(a, "startoveralltimer", new Date);
                    e.supportsTextContent = "x" === f("<span>x</span>")[0].textContent;
                    e.supportsDataObject = 1.4 <= parseFloat(f.fn.jquery);
                    e.string = {max: 1, min: -1, "max+": 1, "max-": -1, zero: 0, none: 0, "null": 0, top: !0, bottom: !1};
                    /tablesorter\-/.test(b.attr("class")) || (t = "" !== e.theme ? " tablesorter-" + e.theme : "");
                    e.$table = b.addClass(e.tableClass + t);
                    e.$tbodies = b.children("tbody:not(." + e.cssInfoBlock + ")");
                    z(a);
                    if (a.config.widthFixed && 0 === f(a).find("colgroup").length) {
                        var p = f("<colgroup>"), k = f(a).width();
                        f(a.tBodies[0]).find("tr:first").children("td").each(function () {
                            p.append(f("<col>").css("width", parseInt(1E3 * (f(this).width() / k), 10) / 10 + "%"))
                        });
                        f(a).prepend(p)
                    }
                    j(a);
                    e.delayInit || s(a);
                    I(a);
                    e.supportsDataObject && "undefined" !== typeof b.data().sortlist ? e.sortList = b.data().sortlist : m && (b.metadata() && b.metadata().sortlist) && (e.sortList = b.metadata().sortlist);
                    g.applyWidget(a, !0);
                    0 < e.sortList.length ? b.trigger("sorton", [e.sortList, {}, !e.initWidgets]) : e.initWidgets && g.applyWidget(a);
                    e.showProcessing && b.unbind("sortBegin.tablesorter sortEnd.tablesorter").bind("sortBegin.tablesorter sortEnd.tablesorter", function (b) {
                        g.isProcessing(a, "sortBegin" === b.type)
                    });
                    a.hasInitialized = !0;
                    a.isProcessing = !1;
                    e.debug && g.benchmark("Overall initialization time", f.data(a, "startoveralltimer"));
                    b.trigger("tablesorter-initialized", a);
                    "function" === typeof e.initialized && e.initialized(a)
                })
            };
            g.isProcessing = function (c, b, a) {
                c = f(c);
                var e = c[0].config;
                c = a || c.find("." + e.cssHeader);
                b ? (0 < e.sortList.length && (c = c.filter(function () {
                    return this.sortDisabled ? !1 : g.isValueInArray(parseFloat(f(this).attr("data-column")), e.sortList)
                })), c.addClass(e.cssProcessing)) : c.removeClass(e.cssProcessing)
            };
            g.processTbody = function (c, b, a) {
                if (a)
                    return c.isProcessing = !0, b.before('<span class="tablesorter-savemyplace"/>'), a = f.fn.detach ? b.detach() : b.remove();
                a = f(c).find("span.tablesorter-savemyplace");
                b.insertAfter(a);
                a.remove();
                c.isProcessing = !1
            };
            g.clearTableBody = function (c) {
                f(c)[0].config.$tbodies.empty()
            };
            g.restoreHeaders = function (c) {
                var b = c.config;
                b.$headers.each(function (a) {
                    f(this).find(".tablesorter-header-inner").length && f(this).html(b.headerContent[a])
                })
            };
            g.destroy = function (c, b, a) {
                c = f(c)[0];
                if (c.hasInitialized) {
                    g.refreshWidgets(c, !0, !0);
                    var e = f(c), d = c.config, m = e.find("thead:first"), p = m.find("tr." + d.cssHeaderRow).removeClass(d.cssHeaderRow), k = e.find("tfoot:first > tr").children("th, td");
                    m.find("tr").not(p).remove();
                    e.removeData("tablesorter").unbind("sortReset update updateAll updateRows updateCell addRows sorton appendCache applyWidgetId applyWidgets refreshWidgets destroy mouseup mouseleave sortBegin sortEnd ".split(" ").join(".tablesorter "));
                    d.$headers.add(k).removeClass(d.cssHeader + " " + d.cssAsc + " " + d.cssDesc).removeAttr("data-column");
                    p.find(d.selectorSort).unbind("mousedown.tablesorter mouseup.tablesorter");
                    g.restoreHeaders(c);
                    !1 !== b && e.removeClass(d.tableClass + " tablesorter-" + d.theme);
                    c.hasInitialized = !1;
                    "function" === typeof a && a(c)
                }
            };
            g.regex = [/(^([+\-]?(?:0|[1-9]\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)?)?$|^0x[0-9a-f]+$|\d+)/gi, /(^([\w ]+,?[\w ]+)?[\w ]+,?[\w ]+\d+:\d+(:\d+)?[\w ]?|^\d{1,4}[\/\-]\d{1,4}[\/\-]\d{1,4}|^\w+, \w+ \d+, \d{4})/, /^0x[0-9a-f]+$/i];
            g.sortText = function (c, b, a, e) {
                if (b === a)
                    return 0;
                var d = c.config, m = d.string[d.empties[e] || d.emptyTo], f = g.regex;
                if ("" === b && 0 !== m)
                    return"boolean" === typeof m ? m ? -1 : 1 : -m || -1;
                if ("" === a && 0 !== m)
                    return"boolean" === typeof m ? m ? 1 : -1 : m || 1;
                if ("function" === typeof d.textSorter)
                    return d.textSorter(b, a, c, e);
                c = b.replace(f[0], "\\0$1\\0").replace(/\\0$/, "").replace(/^\\0/, "").split("\\0");
                e = a.replace(f[0], "\\0$1\\0").replace(/\\0$/, "").replace(/^\\0/, "").split("\\0");
                b = parseInt(b.match(f[2]), 16) || 1 !== c.length && b.match(f[1]) && Date.parse(b);
                if (a = parseInt(a.match(f[2]), 16) || b && a.match(f[1]) && Date.parse(a) || null) {
                    if (b < a)
                        return-1;
                    if (b > a)
                        return 1
                }
                d = Math.max(c.length, e.length);
                for (b = 0; b < d; b++) {
                    a = isNaN(c[b]) ? c[b] || 0 : parseFloat(c[b]) || 0;
                    f = isNaN(e[b]) ? e[b] || 0 : parseFloat(e[b]) || 0;
                    if (isNaN(a) !== isNaN(f))
                        return isNaN(a) ? 1 : -1;
                    typeof a !== typeof f && (a += "", f += "");
                    if (a < f)
                        return-1;
                    if (a > f)
                        return 1
                }
                return 0
            };
            g.sortTextDesc = function (c, b, a, e) {
                if (b === a)
                    return 0;
                var d = c.config, f = d.string[d.empties[e] || d.emptyTo];
                return"" === b && 0 !== f ? "boolean" === typeof f ? f ? -1 : 1 : f || 1 : "" === a && 0 !== f ? "boolean" === typeof f ? f ? 1 : -1 : -f || -1 : "function" === typeof d.textSorter ? d.textSorter(a, b, c, e) : g.sortText(c, a, b)
            };
            g.getTextValue = function (c, b, a) {
                if (b) {
                    var e = c ? c.length : 0, d = b + a;
                    for (b = 0; b < e; b++)
                        d += c.charCodeAt(b);
                    return a * d
                }
                return 0
            };
            g.sortNumeric = function (c, b, a, e, d, f) {
                if (b === a)
                    return 0;
                c = c.config;
                e = c.string[c.empties[e] || c.emptyTo];
                if ("" === b && 0 !== e)
                    return"boolean" === typeof e ? e ? -1 : 1 : -e || -1;
                if ("" === a && 0 !== e)
                    return"boolean" === typeof e ? e ? 1 : -1 : e || 1;
                isNaN(b) && (b = g.getTextValue(b, d, f));
                isNaN(a) && (a = g.getTextValue(a, d, f));
                return b - a
            };
            g.sortNumericDesc = function (c, b, a, d, f, m) {
                if (b === a)
                    return 0;
                c = c.config;
                d = c.string[c.empties[d] || c.emptyTo];
                if ("" === b && 0 !== d)
                    return"boolean" === typeof d ? d ? -1 : 1 : d || 1;
                if ("" === a && 0 !== d)
                    return"boolean" === typeof d ? d ? 1 : -1 : -d || -1;
                isNaN(b) && (b = g.getTextValue(b, f, m));
                isNaN(a) && (a = g.getTextValue(a, f, m));
                return a - b
            };
            g.characterEquivalents = {a: "\u00e1\u00e0\u00e2\u00e3\u00e4\u0105\u00e5", A: "\u00c1\u00c0\u00c2\u00c3\u00c4\u0104\u00c5", c: "\u00e7\u0107\u010d", C: "\u00c7\u0106\u010c", e: "\u00e9\u00e8\u00ea\u00eb\u011b\u0119", E: "\u00c9\u00c8\u00ca\u00cb\u011a\u0118", i: "\u00ed\u00ec\u0130\u00ee\u00ef\u0131", I: "\u00cd\u00cc\u0130\u00ce\u00cf", o: "\u00f3\u00f2\u00f4\u00f5\u00f6", O: "\u00d3\u00d2\u00d4\u00d5\u00d6", ss: "\u00df", SS: "\u1e9e", u: "\u00fa\u00f9\u00fb\u00fc\u016f", U: "\u00da\u00d9\u00db\u00dc\u016e"};
            g.replaceAccents = function (c) {
                var b, a = "[", d = g.characterEquivalents;
                if (!g.characterRegex) {
                    g.characterRegexArray = {};
                    for (b in d)
                        "string" === typeof b && (a += d[b], g.characterRegexArray[b] = RegExp("[" + d[b] + "]", "g"));
                    g.characterRegex = RegExp(a + "]")
                }
                if (g.characterRegex.test(c))
                    for (b in d)
                        "string" === typeof b && (c = c.replace(g.characterRegexArray[b], b));
                return c
            };
            g.isValueInArray = function (c, b) {
                var a, d = b.length;
                for (a = 0; a < d; a++)
                    if (b[a][0] === c)
                        return!0;
                return!1
            };
            g.addParser = function (c) {
                var b, a = g.parsers.length, d = !0;
                for (b = 0; b < a; b++)
                    g.parsers[b].id.toLowerCase() === c.id.toLowerCase() && (d = !1);
                d && g.parsers.push(c)
            };
            g.getParserById = function (c) {
                var b, a = g.parsers.length;
                for (b = 0; b < a; b++)
                    if (g.parsers[b].id.toLowerCase() === c.toString().toLowerCase())
                        return g.parsers[b];
                return!1
            };
            g.addWidget = function (c) {
                g.widgets.push(c)
            };
            g.getWidgetById = function (c) {
                var b, a, d = g.widgets.length;
                for (b = 0; b < d; b++)
                    if ((a = g.widgets[b]) && a.hasOwnProperty("id") && a.id.toLowerCase() === c.toLowerCase())
                        return a
            };
            g.applyWidget = function (c, b) {
                c = f(c)[0];
                var a = c.config, d = a.widgetOptions, j = [], m, p, k;
                a.debug && (m = new Date);
                a.widgets.length && (a.widgets = f.grep(a.widgets, function (b, c) {
                    return f.inArray(b, a.widgets) === c
                }), f.each(a.widgets || [], function (a, b) {
                    if ((k = g.getWidgetById(b)) && k.id)
                        k.priority || (k.priority = 10), j[a] = k
                }), j.sort(function (a, b) {
                    return a.priority < b.priority ? -1 : a.priority === b.priority ? 0 : 1
                }), f.each(j, function (g, h) {
                    h && (b ? (h.hasOwnProperty("options") && (d = c.config.widgetOptions = f.extend(!0, {}, h.options, d)), h.hasOwnProperty("init") && h.init(c, h, a, d)) : !b && h.hasOwnProperty("format") && h.format(c, a, d, !1))
                }));
                a.debug && (p = a.widgets.length, w("Completed " + (!0 === b ? "initializing " : "applying ") + p + " widget" + (1 !== p ? "s" : ""), m))
            };
            g.refreshWidgets = function (c, b, a) {
                c = f(c)[0];
                var e, j = c.config, m = j.widgets, p = g.widgets, k = p.length;
                for (e = 0; e < k; e++)
                    if (p[e] && p[e].id && (b || 0 > f.inArray(p[e].id, m)))
                        j.debug && d("Refeshing widgets: Removing " + p[e].id), p[e].hasOwnProperty("remove") && p[e].remove(c, j, j.widgetOptions);
                !0 !== a && g.applyWidget(c, b)
            };
            g.getData = function (c, b, a) {
                var d = "";
                c = f(c);
                var g, m;
                if (!c.length)
                    return"";
                g = f.metadata ? c.metadata() : !1;
                m = " " + (c.attr("class") || "");
                "undefined" !== typeof c.data(a) || "undefined" !== typeof c.data(a.toLowerCase()) ? d += c.data(a) || c.data(a.toLowerCase()) : g && "undefined" !== typeof g[a] ? d += g[a] : b && "undefined" !== typeof b[a] ? d += b[a] : " " !== m && m.match(" " + a + "-") && (d = m.match(RegExp("\\s" + a + "-([\\w-]+)"))[1] || "");
                return f.trim(d)
            };
            g.formatFloat = function (c, b) {
                if ("string" !== typeof c || "" === c)
                    return c;
                var a;
                c = (b && b.config ? !1 !== b.config.usNumberFormat : "undefined" !== typeof b ? b : 1) ? c.replace(/,/g, "") : c.replace(/[\s|\.]/g, "").replace(/,/g, ".");
                /^\s*\([.\d]+\)/.test(c) && (c = c.replace(/^\s*\(/, "-").replace(/\)/, ""));
                a = parseFloat(c);
                return isNaN(a) ? f.trim(c) : a
            };
            g.isDigit = function (c) {
                return isNaN(c) ? /^[\-+(]?\d+[)]?$/.test(c.toString().replace(/[,.'"\s]/g, "")) : !0
            }
        }});
    var j = f.tablesorter;
    f.fn.extend({tablesorter: j.construct});
    j.addParser({id: "text", is: function () {
            return!0
        }, format: function (d, w) {
            var r = w.config;
            d && (d = f.trim(r.ignoreCase ? d.toLocaleLowerCase() : d), d = r.sortLocaleCompare ? j.replaceAccents(d) : d);
            return d
        }, type: "text"});
    j.addParser({id: "digit", is: function (d) {
            return j.isDigit(d)
        }, format: function (d, f) {
            return d ? j.formatFloat(d.replace(/[^\w,. \-()]/g, ""), f) : d
        }, type: "numeric"});
    j.addParser({id: "currency", is: function (d) {
            return/^\(?\d+[\u00a3$\u20ac\u00a4\u00a5\u00a2?.]|[\u00a3$\u20ac\u00a4\u00a5\u00a2?.]\d+\)?$/.test((d || "").replace(/[,. ]/g, ""))
        }, format: function (d, f) {
            return d ? j.formatFloat(d.replace(/[^\w,. \-()]/g, ""), f) : d
        }, type: "numeric"});
    j.addParser({id: "ipAddress", is: function (d) {
            return/^\d{1,3}[\.]\d{1,3}[\.]\d{1,3}[\.]\d{1,3}$/.test(d)
        }, format: function (d, f) {
            var r, u = d ? d.split(".") : "", s = "", v = u.length;
            for (r = 0; r < v; r++)
                s += ("00" + u[r]).slice(-3);
            return d ? j.formatFloat(s, f) : d
        }, type: "numeric"});
    j.addParser({id: "url", is: function (d) {
            return/^(https?|ftp|file):\/\//.test(d)
        }, format: function (d) {
            return d ? f.trim(d.replace(/(https?|ftp|file):\/\//, "")) : d
        }, type: "text"});
    j.addParser({id: "isoDate", is: function (d) {
            return/^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}/.test(d)
        }, format: function (d, f) {
            return d ? j.formatFloat("" !== d ? (new Date(d.replace(/-/g, "/"))).getTime() || "" : "", f) : d
        }, type: "numeric"});
    j.addParser({id: "percent", is: function (d) {
            return/(\d\s?%|%\s?\d)/.test(d)
        }, format: function (d, f) {
            return d ? j.formatFloat(d.replace(/%/g, ""), f) : d
        }, type: "numeric"});
    j.addParser({id: "usLongDate", is: function (d) {
            return/^[A-Z]{3,10}\.?\s+\d{1,2},?\s+(\d{4})(\s+\d{1,2}:\d{2}(:\d{2})?(\s+[AP]M)?)?$/i.test(d) || /^\d{1,2}\s+[A-Z]{3,10}\s+\d{4}/i.test(d)
        }, format: function (d, f) {
            return d ? j.formatFloat((new Date(d.replace(/(\S)([AP]M)$/i, "$1 $2"))).getTime() || "", f) : d
        }, type: "numeric"});
    j.addParser({id: "shortDate", is: function (d) {
            return/(^\d{1,2}[\/\s]\d{1,2}[\/\s]\d{4})|(^\d{4}[\/\s]\d{1,2}[\/\s]\d{1,2})/.test((d || "").replace(/\s+/g, " ").replace(/[\-.,]/g, "/"))
        }, format: function (d, f, r, u) {
            if (d) {
                r = f.config;
                var s = r.headerList[u], v = s.shortDateFormat;
                "undefined" === typeof v && (v = s.shortDateFormat = j.getData(s, r.headers[u], "dateFormat") || r.dateFormat);
                d = d.replace(/\s+/g, " ").replace(/[\-.,]/g, "/");
                "mmddyyyy" === v ? d = d.replace(/(\d{1,2})[\/\s](\d{1,2})[\/\s](\d{4})/, "$3/$1/$2") : "ddmmyyyy" === v ? d = d.replace(/(\d{1,2})[\/\s](\d{1,2})[\/\s](\d{4})/, "$3/$2/$1") : "yyyymmdd" === v && (d = d.replace(/(\d{4})[\/\s](\d{1,2})[\/\s](\d{1,2})/, "$1/$2/$3"))
            }
            return d ? j.formatFloat((new Date(d)).getTime() || "", f) : d
        }, type: "numeric"});
    j.addParser({id: "time", is: function (d) {
            return/^(([0-2]?\d:[0-5]\d)|([0-1]?\d:[0-5]\d\s?([AP]M)))$/i.test(d)
        }, format: function (d, f) {
            return d ? j.formatFloat((new Date("2000/01/01 " + d.replace(/(\S)([AP]M)$/i, "$1 $2"))).getTime() || "", f) : d
        }, type: "numeric"});
    j.addParser({id: "metadata", is: function () {
            return!1
        }, format: function (d, j, r) {
            d = j.config;
            d = !d.parserMetadataName ? "sortValue" : d.parserMetadataName;
            return f(r).metadata()[d]
        }, type: "numeric"});
    j.addWidget({id: "zebra", priority: 90, format: function (d, w, r) {
            var u, s, v, z, A, E, y = RegExp(w.cssChildRow, "i"), B = w.$tbodies;
            w.debug && (A = new Date);
            for (d = 0; d < B.length; d++)
                u = B.eq(d), E = u.children("tr").length, 1 < E && (v = 0, u = u.children("tr:visible"), u.each(function () {
                    s = f(this);
                    y.test(this.className) || v++;
                    z = 0 === v % 2;
                    s.removeClass(r.zebra[z ? 1 : 0]).addClass(r.zebra[z ? 0 : 1])
                }));
            w.debug && j.benchmark("Applying Zebra widget", A)
        }, remove: function (d, j, r) {
            var u;
            j = j.$tbodies;
            var s = (r.zebra || ["even", "odd"]).join(" ");
            for (r = 0; r < j.length; r++)
                u = f.tablesorter.processTbody(d, j.eq(r), !0), u.children().removeClass(s), f.tablesorter.processTbody(d, u, !1)
        }})
}(jQuery);