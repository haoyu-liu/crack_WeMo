(function () {
define('text!widgets/wemo_insight/css/main.css',[],function () { return '#wemoWidget {\n    height: 100%;\n}\n.wemo_insight .smart-drawer {\n    background: #ffffff;\n}\n.wemo_insight .smart-tile .icon, .wemo_insight .defaultIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADwCAMAAAAJixmgAAAABGdBTUEAALGPC/xhBQAAAvpQTFRFkJCTv7/B0dHSOzs7QEBAfHx9xsbHtra3k5OT1dXWycnLAAAAdHR0qqqrAAAAi4uLdnZ2w8PDl5eZtra5sbGy4uLjQUFBAAAAvb2+xsbGtLS0fn5+2dnbWVlaAAAAEBAQrq6wysrL2dnZysrMZmZojo6Qm5ub0tLUxsbIqqqrnZ2ewcHCzs7Pzc3OqqqtXFxfBAQEdXV1UFBQ0dHT29vc3Nzdi4uLoaGiLy8zAAAAz8/RHBwcQEBAAAAAAAAAAAAAaWlpAAAA1tbYS0tLvb2+AAAAioqKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwMDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAoe5/kehtkNl1i8hvSW41gZ9t3N3fWoBHIDQad8BW6ens4ODfMkMsMVQhUZI2SVBJYWBiVlRXaZZM4eDih65kXl5fZmBrT09QWFtYPz9Aenp9Ojo7GRgbRkZIHhshiIiLsrK25OToZWZm7e3tbW1uLy8w/f3+2trdf3+B6Ojo5ubplZWYl5ea29vedXV5JiUoAwMGICEh3d3djY2QMzM1+vr7mpqdoqKl5OTk9/f49fX2kpKWqqqtn5+is7O26enp2dnb39/iKios3NzcCQkLrKyvtbW4sbG0o6Omu72+cnJ0uLm7xcXH3t7e4ODgnJyfubu9vr7A8/P0np6hDw8Rtre64+Pj4uLiAAAA7+/x1tbYoKCjBgYIwcLEpaWo6ursv8DC19jZ0dHTz8/RqKirBwcK1dXXxsfJw8PF7u7wzc3Pr6+yy8vN09PV8vLz6+vt3NzfpqapycnL2trc5ubn7e3v6Ojq5eXm8fHy3t7g6enr6urq29vc5eXo8PDx5+fo5+fp7Ozu6+vs7Ozt6enq5eXn5OTl4+Pl4eHj5ubo7+/w39/f7e3u4uLk4ODh5OTm6Ojp29vd4+Pk4eHi39/h4uLj4ODi3Nzd3d3e3Nze7u7v39/g3d3f3t7foUrPxAAAAGB0Uk5TtPH6WmrL8+ir+PJ9v+dv0pLRoNDJ+qN4z+arhfuudIy/6e7hup2n6ty63trs56Buanxo9vL1lrFQYfJIVxBZTXdR6V7xgY4IU0gUFhslBQk4IhkfLypCMwo9Eg4HAwEAt1toPwAAIABJREFUeNrtnQd0G9eZ77O72d30Hjt5ronX3VmXJJbjFiVOpETN6o1Fr2zf1M3zc1wldzU3yeqNskRRNCmJpETRpESxmr2JBFFJAESvM8AUtJk5533fvXdAys7bc0JTkPc8fABmLgZDHvzm/5V7B1M+te7/M/tUHjgPnAfOA+eB88B54DxwHjgPnAfOA+eB88B54DxwHjgPnAfOA+eB88B54DxwHjgPnAfOA+eB88B54DxwHjgPnAfOA+eB88B54DxwHjgPnAfOA8+MFRcXLSpcXVCwlti8efOpLV26dAGzpUvnz8PPHikoeLywqKi4+L8ocHExcM5btmLxmoceu/vea+ag3f+1v5+0/8bs72+5+X7y6TWz73tg5eJVC5euLZhbVPxfCri4sGDewlUPzZ5z/6yv33Trg5+9NuCc2PPqq3vGOo8d2L7xvZdf/N2LYC+/9/T6nb2NbcFXX311r92ccSjXfvfWW++88WtzrnlszfIFQP1fA7ho9dLlK++9//abHowPdo8ONjU1WY1Bu7lx/R+fefPtt98E+9U//wfaP2D77bfffuW5F0937HV7bE1udyYSsg/UxD5761dvmfNXq5YVFBZ/woGLCpYtvvvmb92ldQ9ajc5g0BlDM9Tsf+r559985R1qr7zz2z/+9o9Pvau/f/fNZ9/83UjIaLPZrDbbv1mtTS+NZgZCP7hp1r1rlhUUfXKBi+fOX3z3LTddO2HzbPaOb3bGANdoNHocAxvPvPmubm8+/6tXnv/1b95+81fvPp9d+O7zryQnbC5iTS6XzdZkc41maoRbZ929fO2iTyZw8eplD9x/27WDMQM/Pu50AqzH47FarTZrpOfM888++/zbxJ799b/+x7+c+ef//vaz//Cvv3mbLHwePn37/L4dLvegaxBeLpebkNts7szAN79676q1RZ88YMB9+JYHY5t4gfeOOxwgrZXQNsEjEn/zlXfffvYM2tF/+R///NaZo7/6jzNn3nr+f/7m/JmjZ848+/yb7zzz5rB5wj0xMeF24wttkEBPmINfnb2ioPgTBly4AHCNJjnq9wEvqguw6JfEakrffea555576pl3Xnn33X/811//C8A/+/avf/O/fvvuM08999snn3zyqXdK97oiaBORCWruCfegGx18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);\n}\n.wemo_insight .icon {\n    background-size: 100% 100%;\n}\n.wemo_insight .mainContent {\n    width: 100%;\n    background-color: white;\n    overflow: hidden;\n    padding-left: 1em;\n    display: inline-flex;\n    border-top: 1px solid #DDDDDD;\n}\n.wemo_insight .content .firstContent {\n    width: 88%;\n    height: 12em;\n    margin-left: 0;\n    float: left;\n    display: block;\n    padding: 1em 0;\n}\n.wemo_insight .stopwatchIcon {\n    display: inline-block;\n    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAsCAMAAAA+eDr6AAAABGdBTUEAALGPC/xhBQAAAEVQTFRFdHR0Pz8/dnZ2fHx8d3d3iIiI////1tbW////+vr6h4eHs7Oz////////5+fnxMTElZWVfn5+o6Oj////////AAAAdXV1Lz74zgAAABZ0Uk5T8/3+8vziUJBAcOCwIDCAoNDwwGAQADaa5RIAAAGXSURBVDjLlZTrYgQRDIW1287NnfD+j9oQZoyx2ubXLt/kRMRhoQk4Yg4rQxes/bPHEnqKqYq5v2XjU0zYgi1TLIgtx+MEHfY2fsdkj4HXLlV2OHXKgonmhm08NnEoyKsrdbFiwtG2cc7Ree1+9khXzKetYy1asOTMLiXMnxdMJ8jfWqPL3WJxWB2rlIbuhNtROM4hYx4p/+xEymPF2Tc5oNZ8q1mvYljk2lGaLj/lUwVDyaOjcInEUMgCYZhse1D6msCcjolTv6FKMpS10WZs7+tPlGqqzMPHUBPu1Fd8XSsbnY/Zu6ZkX22yEGx+GOw++PD6jB/f7XeoRlj7beB9r/UQw8m5JUstGWFBwBhz06fACTOPq7oH7TN9tXwUQGoMm75PME+1M7y1mSq2TeYJ0cPRrccug8HSLwuTZL5M7zowqsvJTB3yZKXr2D4iVUavXtoxl9b3xpGWZJAwUDyHnV79YvtXT6aiO3+TJtnDfmZckhE0fa+OBOTihiulVnInI0duKbRtDc74d6aKbmnI2hq7/JdF/wBIboNKajGYdAAAAABJRU5ErkJggg==) no-repeat;\n    width: 3em;\n    height: 3em;\n    float: left;\n    background-size: 80%;\n    margin-top: 1em;\n    margin-right: 1em;\n}\n.wemo_insight .ui-block-a {\n    width: 60%;\n    float: left;\n    height: 100%;\n    display: block;\n}\n.wemo_insight .state_duration_text {\n    color: #73d44c;\n    font-size: 2em;\n    height: 20%;\n    position: relative;\n    display: block;\n    margin: 0.1em 0 1em;\n}\n.wemo_insight .duration {\n    color: #73d44c;\n    font-weight: bold;\n    font-size: 5em;\n    display: inline-block;\n}\n.wemo_insight .duration.durationAux {\n    font-size: 3em;\n}\n.wemo_insight .seconds, .wemo_insight .unitAux {\n    color: #73d44c;\n    font-size: 2em;\n    display: inline-block;\n}\n.wemo_insight .ui-block-b {\n    width: 40%;\n    height: 100%;\n    float: right;\n}\n.wemo_insight .off_since_text {\n    font-size: 2em;\n    height: 20%;\n    position: relative;\n    display: block;\n    margin: 0.1em 0 2em;\n}\n.wemo_insight .off_since_time {\n    font-weight: bold;\n    font-size: 3em;\n}\n.wemo_insight .off_since_unit {\n    font-size: 2em;\n    margin-top: 1em;\n}\n.wemo_insight .secondContent,\n.wemo_insight .thirdContent,\n.wemo_insight .fourthContent {\n    width: 100%;\n    background-color: white;\n    display: inline-flex;\n}\n.wemo_insight .content .dayInfo {\n    margin-left: 5em;\n    border-top: 1px solid #dddddd;\n}\n.wemo_insight .content .dayInfo,\n.wemo_insight .content .estimatedDollars,\n.wemo_insight .content .estimatedUsage {\n    float: left;\n    padding: 1.2em 0;\n    width: 86%;\n    height: 100%;\n    display: block;\n}\n.wemo_insight .content .dayInfo,\n.wemo_insight .content .estimatedDollars {\n    border-bottom: 1px solid #dddddd;\n}\n.wemo_insight .ui-block-c {\n    float: left;\n    width: 70%;\n    height: 100%;\n    display: block;\n}\n.wemo_insight .on_today {\n    margin-bottom: .6em;\n}\n.wemo_insight .on_today,\n.wemo_insight .on_avg_day {\n    display: block;\n    font-size: 2em;\n}\n.wemo_insight .ui-block-d {\n    float: right;\n    width: 30%;\n    height: 100%;\n}\n.wemo_insight .on_today_time {\n    margin-bottom: .6em;\n}\n.wemo_insight .on_today_time,\n.wemo_insight .on_avg_time {\n    display: block;\n    font-size: 2em;\n    font-weight: bold;\n}\n.wemo_insight .dollarIcon,\n.wemo_insight .lightIcon {\n    float: left;\n    margin: 1.1em 1em 0;\n    width: 3em;\n    height: 3em;\n    display: inline-block;\n    background-size: 80%;\n    background-repeat: no-repeat;\n}\n.wemo_insight .dollarIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAABGdBTUEAALGPC/xhBQAAAEhQTFRFZ2dnZWVlZ2dnZmZmZmZmZWVlZGRkZmZmZWVlZmZmZmZmZ2dnZmZmZWVlZGRkZGRkZmZmZWVlZmZmZmZmZmZmX19fAAAAZmZmltsU0AAAABd0Uk5TT78gn+Bv0K8/789AcLBgMMCAUKDwEADz9BKkAAAA90lEQVQoz32T2XbFIAhF7XSHJM6S8/9/WjQKtF29vASzhcCBuHMaBd/A1nyg9c5NVGGskoWFg1ot8Txjqd0vCjMfD0lGmXFekFkSNHC6KMPCH5lv83K4hNIhNaQVkqBeI4a1Py7bPxFW5sbpHAGH5gJu8+YBkAsSGLA94sdV5wgNzks1Cf3WF0ke7xrKgk/bDjfRHBDnyYs3LAIM12lHy9nwH/AMT1itBjSXH+4u9fW0WtBlG0xB2sqUF7u2oiLEodQNRgSVryKFIomGfCo83bu2b2SEtyN736T0OTI7bJnnGrZdk738XpM/C3bYBXu9mq+X+p/f4Rs2hT+09Vu8zwAAAABJRU5ErkJggg==);\n}\n.wemo_insight .lightIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAeCAMAAAAFBf7qAAAABGdBTUEAALGPC/xhBQAAADZQTFRFeXl5f39/hYWFiIiIdnZ2kJCQioqKbm5ujo6OfHx8cnJygICAjo6OdXV1kJCQY2NjAAAAZmZml6RgDAAAABF0Uk5TyKyNe8gsaexWu+GdQtUX9gCDrDynAAAAzUlEQVQoz23RURKFIAgFUOupKBrI/jf7KpXU4qvxzCT3akofxzJMLMUoWdTPzKc85CXMokSwLaKUmBbplMWv0uk4VJAm+ol7SSXi9JZKEdqaOMhNoUUiFDz6mJvAttSpjxXMFz2RtBm2dP3Q8b5Ikq3epZF6ZZF/dQ0veRKH3A4MXK8D50r+3YYL5yQAqrXEObLWG2UvK9270MGhrHTXmwGnjZ56a86VrnpbzvKqV3MuhPbJOdPOfnzBgYhhyDlRFNnLJwWZco60Yf6W8geU2SygKfrTLwAAAABJRU5ErkJggg==);\n}\n.wemo_insight .ui-block-e {\n    float: left;\n    width: 70%;\n    height: 100%;\n    display: block;\n}\n.wemo_insight .estimated_monthly {\n    margin-bottom: .6em;\n}\n.wemo_insight .estimated_monthly,\n.wemo_insight .estimated_today {\n    display: block;\n    font-size: 2em;\n}\n.wemo_insight .ui-block-f {\n    float: right;\n    width: 30%;\n    height: 100%;\n}\n.wemo_insight .estimated_monthly_val {\n    margin-bottom: .6em;\n}\n.wemo_insight .estimated_monthly_val,\n.wemo_insight .estimated_today_val {\n    display: block;\n    font-size: 2em;\n}\n.wemo_insight .estimated_monthly_val .monthly,\n.wemo_insight .estimated_today_val .today {\n    font-weight: bold;\n}\n.wemo_insight .ui-block-g {\n    float: left;\n    width: 70%;\n    height: 100%;\n    display: block;\n}\n.wemo_insight .avg {\n    margin-bottom: .6em;\n}\n.wemo_insight .avg,\n.wemo_insight .now {\n    display: block;\n    font-size: 2em;\n}\n.wemo_insight .ui-block-h {\n    float: right;\n    width: 30%;\n    height: 100%;\n}\n.wemo_insight .avg_value {\n    margin-bottom: .6em;\n}\n.wemo_insight .avg_value,\n.wemo_insight .now_value {\n    display: block;\n    font-size: 2em;\n    font-weight: bold;\n}\n.wemo_insight .on_today_time span,\n.wemo_insight .on_avg_time span,\n.wemo_insight .estimated_monthly_val span,\n.wemo_insight .estimated_today_val span,\n.wemo_insight .avg_value span,\n.wemo_insight .now_value span {\n    display: inline;\n    font-weight: normal;\n    vertical-align: bottom;\n}\n.wemo_insight .smart-tile .powerState {\n    background-size: 100%;\n}\n.wemo_insight .smart-tile .powerLight-0 {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAR1QTFRFmpqaiYmJfn5+f39/mJiYiIiIl5eXkpKSlpaWj4+Ptra2tLS0bGxsfX19VFRUg4ODYWFhhISELy8vp6enf39/SUlJRkZGWFhYPz8/paWlDw8Pt7e3AAAAnp6eq6uroqKigICApKSkjIyMmZmZrKyso6Ojvb29iIiIra2tkZGRrq6unJycsLCwlZWVpqamioqKv7+/j4+Ps7OzmJiYi4uLkJCQoaGhl5eXmpqan5+foKCgwsLCz8/PlpaWu7u7sbGxtbW1paWlh4eHqKiovLy8ycnJuLi4tLS0xMTEx8fHzc3Nt7e3srKywcHBw8PDvr6+1tbW29vbxsbGy8vLwMDAyMjI0NDQxcXFzMzMysrK09PT1NTU2NjY0dHRzs7OJPKKDwAAAB10Uk5TwPDw8HDwwFBwUK+vsPBwwHBwEO9QUFBwEG8Q7wCnwIwGAAABDElEQVQY023Q1W7DQBAFUJcpzLHbpswU5sTMkJhx//8zmnWtyJVyX0Y60mpnLnK5I8jfQHOZ7E02k0NTWNsne+1++448qG2xTvbvx7cEMRm9PtcTrH7PBw+yxErcy2O3V40RPRp+ybTiCLr6hFOjPRRi4ZPgTMEF9gwwU4kaFiDmJx+a4EZ+EPgzT+m08hDnFOsYtr8Kw5UPLPq6C/H9TbNAFITrdRhErilfQRwvzRSq+ADisWwyYvLcdnkcgVhcaroB4o8iwCidIsRSeeF4m42iyAaupZVL8UUVznQ8QwRANKypVEluP2UVx/I20dXF4balM+xH5XWHN7GTVJ+N5gVGY+fNRrrknc3/zy8HwU3m7KKUiAAAAABJRU5ErkJggg==);\n    background-size: 1.5em 1.5em;\n    vertical-align: middle;\n}\n.wemo_insight .smart-tile .powerLight-1 {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAKhQTFRFLroNFbAHFbEHQ8UZMboNRsUaFa8FRMQWKLMMGa8FKLMNRMQaF64DFa4DRcUYJLMFFbEIKLcMUs0fQMIXP8QWFa0CT8wef+Y0dN8ufuMze+Q0fuQ1AAAAEqsBGK0EKbUMO7wVb9IuXssmGq4FEKoAHa8GG68FJrMLIrIJFq0DNLkRLbYOIbEIObsUPr0WQL4XQ78ZScIcZc0pVMYhWcgjTcMdKLQMMrgQK/M8gAAAAB10Uk5T4/n5zOPM+c3p+unN+vnG6fnjusbN+rpmoHEdewCtYEkTAAAA3UlEQVQY03WQ1xKCMBBFY++CCtJVWiD0luT//0w2MqMyum85szu59yAbxtSs12gmPJFghq6c1EA9KbphDtA0rqpDfIx9sr8CRcAuAQnjiLEoDsmlpwj2glvGUp4kPGXZrd9FtqarJLvzvCjLIuf3bKNryLYUJ2T8UdWU1tWDs3Bl9VAicZpXtO26llZ5Gq8BBn7Ei7r1msZr64JHvoCYJSXtGtdtOlomDP+F0uh8C1AZfbSzIOfhK5IMOftGX+HP0Ai6f9Q8iu7C0nIQIp8HS8LnDE3wdL54+/xtfjxP6lI2NhnQ0HwAAAAASUVORK5CYII=);\n    background-size: 1.5em 1.5em;\n    vertical-align: middle;\n}\n.wemo_insight .smart-tile .powerLight-2 {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAKhQTFRF8boN6bkN6bkP98Aa8boV98Ab9LsP978a5bIJ978c9LwR6bgJ5bIE6bYE+MEd7bMF8boM6boQ+cQi974Y978W5bIC+cIf/803/cox/802/8o0/801AAAA8bUC8rcJ9L4c98Uw/tlq/NJX8rgL8bQA87kO87gN9LwY87sU8rcH9b8h9sIo87oS98Qu98Yz+Mc2+Mg5+cpA/dVf+9BR+s9M+cxE9L0b9sEmIdIbsgAAAB10Uk5T4/n5zOPM6c36zen5+vnG6eP5usbN+rpmoHEdewCXrPSiAAAA3UlEQVQY03WQ1xKCMBBFY++CCtJVWiD0luT//0w2MqMyum85szu59yAbxtSs12gmPJFghq7IaqDKim6YAzSNq+oQH2Of7K9AEbBLQMI4YiyKQ3LpKYK94JaxhKcpT1h263eRrekqye48L8qyyPk9W+sasi3FCRl/VDWldfXgLFxZPZRInOQV7dq2o1WexEuAgR/xou68pvG6uuCRLyBmaUnbxnWblpYpw3+hNDrfAlRGH20syHn4inSCnH2jr/BnaATdP2oeRXdhaTcIOZ0HS8LnDE3wdL54+/xtfjxP5UI2Nn/IhXsAAAAASUVORK5CYII=);\n    background-size: 1.5em 1.5em;\n    vertical-align: middle;\n}\n.wemo_insight .smart-tile .powerLight {\n    height: 1.5em;\n    width: 1.5em;\n    position: absolute;\n    float: left;\n    margin-top: 4.4em;\n    vertical-align: middle;\n    margin-left: -1em;\n}\n.wemo_insight section.content {\n    overflow-y: auto;\n}\n.wemo_insight .sel-mode .mode-btn {\n    color: #fff;\n    display: block;\n    position: relative;\n    float: left;\n    font-size: 2em;\n    height: 100%;\n    width: 33.3%;\n    padding: 0.5em 0 0 2.4em;\n}\n.wemo_insight .sel-mode .last {\n    width: 33.4%;\n}\n.wemo_insight .menu span.active {\n    background: url(data:image/png;base64,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) no-repeat;\n    background-size: 100%;\n}\n.wemo_insight .menu span.disable {\n    opacity: 0.4;\n}\n.wemo_insight .disable {\n    opacity: 0.4;\n}\n.wemo_insight .content .title {\n    font-size: 2em;\n}\n.wemo_insight .content .absoluteBottom {\n    position: absolute;\n    bottom: 5%;\n}\n.wemo_insight .schedule .title {\n    margin-top: .1em;\n}\n.wemo_insight .btnTurnOffOn {\n    float: right;\n    width: 11em;\n}\n.wemo_insight .btnTurn {\n    width: 7.5em;\n    float: right;\n    height: 4.3em;\n    border-radius: 3.625em;\n    background-color: #d9d9d9;\n    border: 1px solid #dddddd;\n    position: relative;\n    -webkit-box-shadow: 0 0.125em 0 0 #777777 inset;\n}\n.wemo_insight header {\n    position: relative;\n}\n.wemo_insight .threshold_container,\n.wemo_insight .costPerKwh_container {\n    padding: 0 2.2em;\n    width: 100%;\n    height: 8.8em;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n}\n.wemo_insight .threshold_container p,\n.wemo_insight .costPerKwh_container p {\n    float: left;\n    margin: 1.2em 0 0 0;\n    width: 80%;\n}\n.wemo_insight .threshold_container .thresholdVal,\n.wemo_insight .costPerKwh_container .costVal {\n    display: block;\n    color: #aaaaaa;\n    font-size: 2em;\n    font-weight: 400;\n}\n.wemo_insight .threshold_container .fa,\n.wemo_insight .costPerKwh_container .fa {\n    float: right;\n    color: #dddddd;\n    font-size: 22px;\n}\n.wemo_insight .threshold_container .fa,\n.wemo_insight .costPerKwh_container .fa {\n    margin-top: 1.1em;\n}\n.wemo_insight .dataExport_container {\n    padding: 0 2.2em;\n    width: 100%;\n    height: 6.4em;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n    line-height: 6.4em;\n}\n.wemo_insight .dataExport_container .fa {\n    float: right;\n    margin-top: 0.65em;\n    color: #dddddd;\n    font-size: 22px;\n}\n.wemo_insight.dataExportPage,\n.wemo_insight.costPerKwhPage,\n.wemo_insight.thresholdPage {\n    position: fixed;\n    top: 0;\n    left: 0;\n    width: 100%;\n    height: 100%;\n    z-index: 120;\n    background-color: #f2f2f2 !important;\n    color: #595959;\n    font-size: 50%;\n}\n.wemo_insight.thresholdPage .content,\n.wemo_insight.costPerKwhPage .content,\n.wemo_insight.dataExportPage .content {\n    padding: 0;\n}\n.wemo_insight .editHeader {\n    position: relative;\n    widht: 100%;\n    height: 6.6em;\n    box-shadow: 0 2px 2px #cfcfcf;\n    background-color: #FFFFFF;\n    line-height: 6.8em;\n}\n.wemo_insight .editHeader .closeIcon {\n    position: absolute;\n    left: 2.3em;\n    top: 1.6em;\n    width: 4.5em;\n    height: 4.5em;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoBAMAAAB+0KVeAAAABGdBTUEAALGPC/xhBQAAABhQTFRFd3d3d3d3d3d3d3d3d3d3d3d3AAAAd3d3j+l4nQAAAAd0Uk5T3O9L7dZRAP+H/xQAAABzSURBVCjPrZKxDcAwCARZIotkKLtNEfnXD7ar8FdFoTydsIGPBhX/wC6A0jDYCQpgit7zLW5YxA2LuGAVF6zihCZOaGJCFxO62GKKpc5wppugCF7U8+DX+Z84Ec+OW+J94ub5RnhNvjsmhLOEqeN8fsz8A0z4Sr1e+UFKAAAAAElFTkSuQmCC);\n    background-repeat: no-repeat;\n    background-size: 70%;\n}\n.wemo_insight .editHeader .title {\n    margin-left: 4em;\n    font-size: 2em;\n}\n.wemo_insight .dataExportContent .intro {\n    margin: 1.25em 6%;\n    width: 88%;\n    display: block;\n    font-size: 2em;\n    line-height: 1.25em;\n    text-align: justify;\n}\n.wemo_insight .dataExportContent .exportInfo {\n    padding: 0;\n    margin-bottom: 2.5em;\n    border-top: 1px solid #cfcfcf;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n    list-style: none;\n}\n.wemo_insight .exportInfo .email_container {\n    padding: 0.6em 2.2em 0;\n    width: 100%;\n    height: 6.3em;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n}\n.wemo_insight .exportSent {\n    text-align: center;\n    color: #73d44c;\n    display:none;\n}\n.wemo_insight .email_container #editEmail {\n    margin: 0;\n    padding: 0;\n    width: 100%;\n    height: 2.5em;\n    border: none;\n    box-shadow: none;\n    background: transparent;\n    color: #595959;\n    font-size: 2em;\n}\n.wemo_insight .exportInfo .schedule_container {\n    padding: 0 2.2em;\n    width: 100%;\n    height: 6.4em;\n    background-color: #ffffff;\n    line-height: 6.4em;\n}\n.wemo_insight .schedule_container .btnTurnOffOn {\n    float: right;\n    margin-top: 1.2em;\n    width: auto;\n}\n.wemo_insight .schedule_container .btnTurn {\n    position: relative;\n    width: 7em;\n    height: 3.9em;\n    border: 1px solid #dddddd;\n    border-radius: 17px;\n    background-color: #d9d9d9;\n}\n.wemo_insight .schedule_container .btnSlider {\n    position: absolute;\n    width: 46%;\n    height: 92%;\n    top: 4%;\n    border-radius: 50%;\n    background-color: #ffffff;\n    -webkit-box-shadow: 0 1px 0 0 #999;\n    -webkit-transition: -webkit-transform 0.2s linear;\n    -webkit-transform: translateX(5%);\n}\n.wemo_insight .schedule_container .btnTurn.toggleOn {\n    background-color: #6FD642;\n}\n.wemo_insight .schedule_container .btnTurn.toggleOn .btnSlider {\n    -webkit-transform: translateX(112%);\n    -webkit-transition: -webkit-transform 0.2s linear;\n}\n.wemo_insight .dataExportContent .emailInterval_container,\n.wemo_insight .costPerkWhContent .currency_container,\n.wemo_insight .costPerkWhContent .cost_container,\n.wemo_insight .thresholdContent .power_container {\n    padding: 1.7em 2.2em;\n    width: 100%;\n    height: 8.8em;\n    border-bottom: 1px solid #cfcfcf;\n    background-color: #ffffff;\n}\n.wemo_insight .dataExportContent .infoInterval_container {\n    margin-top: 1em;\n    padding: 0 2.2em;\n    width: 100%;\n}\n.wemo_insight .infoInterval_container p {\n    margin: 0;\n    color: #999999;\n    font-size: 2em;\n    line-height: 1em;\n}\n.wemo_insight .dataExportContent #interval {\n    display: none;\n}\n.wemo_insight .emailInterval_container .value,\n.wemo_insight .currency_container .value,\n.wemo_insight .cost_container .value,\n.wemo_insight .power_container .value {\n    margin-top: 0.35em;\n    color: #aaaaaa;\n    font-size: 2em;\n}\n.wemo_insight .dataExportContent .sendBtn,\n.wemo_insight .costPerkWhContent .resetBtn,\n.wemo_insight .thresholdContent .autoResetBtn,\n.wemo_insight .thresholdContent .resetBtn {\n    padding: 0.79em 0.81em;\n    margin: 1.25em 5%;\n    width: 90%;\n    overflow: auto;\n    border-radius: 2px;\n    box-shadow: 0 1px 1px #999999;\n    color: #ffffff;\n    font-size: 2em;\n    line-height: 1.25em;\n    text-align: center;\n}\n.wemo_insight .dataExportContent .sendBtn {\n    background-color: #ffffff;\n    color: #73d44c;\n}\n.wemo_insight .dataExportContent .sendBtn.exportBtn,\n.wemo_insight .thresholdContent .autoResetBtn {\n    background-color: #73d44c;\n    color: #ffffff;\n}\n.wemo_insight .dataExportContent .sendBtn.exportBtn:active,\n.wemo_insight .thresholdContent .autoResetBtn:active {\n    background-color: #46a90c;\n}\n.wemo_insight .costPerkWhContent .description_container,\n.wemo_insight .thresholdContent .description_container {\n    padding: 2.5em 2.2em;\n    width: 100%;\n    height: auto;\n    overflow: auto;\n}\n.wemo_insight .description_container .paragraph {\n    display: block;\n    font-size: 2em;\n    text-align: justify;\n}\n.wemo_insight .description_container .paragraph2,\n.wemo_insight .thresholdContent .paragraph2,\n.wemo_insight .thresholdContent .paragraph3 {\n    margin-top: 0.8em;\n}\n.wemo_insight .costPerkWhContent .resetBtn,\n.wemo_insight .thresholdContent .resetBtn {\n    background-color: #ef0000;\n}\n.wemo_insight .costPerkWhContent .resetBtn:active,\n.wemo_insight .thresholdContent .resetBtn:active {\n    background-color: #b40000;\n}\n.wemo_insight .thresholdContent span[data-bind="powerIndicator"] {\n    margin-left: 0.5em;\n    width: 0.63em;\n    height: 0.63em;\n    display: inline-block;\n    background-size: 100%;\n    background-repeat: no-repeat;\n}\n.wemo_insight .thresholdContent .powerNow {\n    margin-left: 0.5em;\n}\n.wemo_insight span[data-bind="powerIndicator"].standby {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAKhQTFRF8boN6bkN6bkP98Aa8boV98Ab9LsP978a5bIJ978c9LwR6bgJ5bIE6bYE+MEd7bMF8boM6boQ+cQi974Y978W5bIC+cIf/803/cox/802/8o0/801AAAA8bUC8rcJ9L4c98Uw/tlq/NJX8rgL8bQA87kO87gN9LwY87sU8rcH9b8h9sIo87oS98Qu98Yz+Mc2+Mg5+cpA/dVf+9BR+s9M+cxE9L0b9sEmIdIbsgAAAB10Uk5T4/n5zOPM6c36zen5+vnG6eP5usbN+rpmoHEdewCXrPSiAAAA3UlEQVQY03WQ1xKCMBBFY++CCtJVWiD0luT//0w2MqMyum85szu59yAbxtSs12gmPJFghq7IaqDKim6YAzSNq+oQH2Of7K9AEbBLQMI4YiyKQ3LpKYK94JaxhKcpT1h263eRrekqye48L8qyyPk9W+sasi3FCRl/VDWldfXgLFxZPZRInOQV7dq2o1WexEuAgR/xou68pvG6uuCRLyBmaUnbxnWblpYpw3+hNDrfAlRGH20syHn4inSCnH2jr/BnaATdP2oeRXdhaTcIOZ0HS8LnDE3wdL54+/xtfjxP5UI2Nn/IhXsAAAAASUVORK5CYII=);\n}\n.wemo_insight span[data-bind="powerIndicator"].on {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAKhQTFRFLroNFbAHFbEHQ8UZMboNRsUaFa8FRMQWKLMMGa8FKLMNRMQaF64DFa4DRcUYJLMFFbEIKLcMUs0fQMIXP8QWFa0CT8wef+Y0dN8ufuMze+Q0fuQ1AAAAEqsBGK0EKbUMO7wVb9IuXssmGq4FEKoAHa8GG68FJrMLIrIJFq0DNLkRLbYOIbEIObsUPr0WQL4XQ78ZScIcZc0pVMYhWcgjTcMdKLQMMrgQK/M8gAAAAB10Uk5T4/n5zOPM+c3p+unN+vnG6fnjusbN+rpmoHEdewCtYEkTAAAA3UlEQVQY03WQ1xKCMBBFY++CCtJVWiD0luT//0w2MqMyum85szu59yAbxtSs12gmPJFghq6c1EA9KbphDtA0rqpDfIx9sr8CRcAuAQnjiLEoDsmlpwj2glvGUp4kPGXZrd9FtqarJLvzvCjLIuf3bKNryLYUJ2T8UdWU1tWDs3Bl9VAicZpXtO26llZ5Gq8BBn7Ei7r1msZr64JHvoCYJSXtGtdtOlomDP+F0uh8C1AZfbSzIOfhK5IMOftGX+HP0Ai6f9Q8iu7C0nIQIp8HS8LnDE3wdL54+/xtfjxP6lI2NhnQ0HwAAAAASUVORK5CYII=);\n}\n.wemo_insight span[data-bind="powerIndicator"].off {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAR1QTFRFmpqaiYmJfn5+f39/mJiYiIiIl5eXkpKSlpaWj4+Ptra2tLS0bGxsfX19VFRUg4ODYWFhhISELy8vp6enf39/SUlJRkZGWFhYPz8/paWlDw8Pt7e3AAAAnp6eq6uroqKigICApKSkjIyMmZmZrKyso6Ojvb29iIiIra2tkZGRrq6unJycsLCwlZWVpqamioqKv7+/j4+Ps7OzmJiYi4uLkJCQoaGhl5eXmpqan5+foKCgwsLCz8/PlpaWu7u7sbGxtbW1paWlh4eHqKiovLy8ycnJuLi4tLS0xMTEx8fHzc3Nt7e3srKywcHBw8PDvr6+1tbW29vbxsbGy8vLwMDAyMjI0NDQxcXFzMzMysrK09PT1NTU2NjY0dHRzs7OJPKKDwAAAB10Uk5TwPDw8HDwwFBwUK+vsPBwwHBwEO9QUFBwEG8Q7wCnwIwGAAABDElEQVQY023Q1W7DQBAFUJcpzLHbpswU5sTMkJhx//8zmnWtyJVyX0Y60mpnLnK5I8jfQHOZ7E02k0NTWNsne+1++448qG2xTvbvx7cEMRm9PtcTrH7PBw+yxErcy2O3V40RPRp+ybTiCLr6hFOjPRRi4ZPgTMEF9gwwU4kaFiDmJx+a4EZ+EPgzT+m08hDnFOsYtr8Kw5UPLPq6C/H9TbNAFITrdRhErilfQRwvzRSq+ADisWwyYvLcdnkcgVhcaroB4o8iwCidIsRSeeF4m42iyAaupZVL8UUVznQ8QwRANKypVEluP2UVx/I20dXF4balM+xH5XWHN7GTVJ+N5gVGY+fNRrrknc3/zy8HwU3m7KKUiAAAAABJRU5ErkJggg==);\n}\n.wemo_insight .row-tile .powerIndicator {\n    width: 1.1em;\n    height: 1.1em;\n    background-size: 100%;\n    background-repeat: no-repeat;\n    margin-top: 4.5em;\n}\n.wemo_insight .row-tile .powerIndicator[data-indicator="standby"] {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAKhQTFRF8boN6bkN6bkP98Aa8boV98Ab9LsP978a5bIJ978c9LwR6bgJ5bIE6bYE+MEd7bMF8boM6boQ+cQi974Y978W5bIC+cIf/803/cox/802/8o0/801AAAA8bUC8rcJ9L4c98Uw/tlq/NJX8rgL8bQA87kO87gN9LwY87sU8rcH9b8h9sIo87oS98Qu98Yz+Mc2+Mg5+cpA/dVf+9BR+s9M+cxE9L0b9sEmIdIbsgAAAB10Uk5T4/n5zOPM6c36zen5+vnG6eP5usbN+rpmoHEdewCXrPSiAAAA3UlEQVQY03WQ1xKCMBBFY++CCtJVWiD0luT//0w2MqMyum85szu59yAbxtSs12gmPJFghq7IaqDKim6YAzSNq+oQH2Of7K9AEbBLQMI4YiyKQ3LpKYK94JaxhKcpT1h263eRrekqye48L8qyyPk9W+sasi3FCRl/VDWldfXgLFxZPZRInOQV7dq2o1WexEuAgR/xou68pvG6uuCRLyBmaUnbxnWblpYpw3+hNDrfAlRGH20syHn4inSCnH2jr/BnaATdP2oeRXdhaTcIOZ0HS8LnDE3wdL54+/xtfjxP5UI2Nn/IhXsAAAAASUVORK5CYII=);\n}\n.wemo_insight .row-tile .powerIndicator[data-indicator="on"] {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAKhQTFRFLroNFbAHFbEHQ8UZMboNRsUaFa8FRMQWKLMMGa8FKLMNRMQaF64DFa4DRcUYJLMFFbEIKLcMUs0fQMIXP8QWFa0CT8wef+Y0dN8ufuMze+Q0fuQ1AAAAEqsBGK0EKbUMO7wVb9IuXssmGq4FEKoAHa8GG68FJrMLIrIJFq0DNLkRLbYOIbEIObsUPr0WQL4XQ78ZScIcZc0pVMYhWcgjTcMdKLQMMrgQK/M8gAAAAB10Uk5T4/n5zOPM+c3p+unN+vnG6fnjusbN+rpmoHEdewCtYEkTAAAA3UlEQVQY03WQ1xKCMBBFY++CCtJVWiD0luT//0w2MqMyum85szu59yAbxtSs12gmPJFghq6c1EA9KbphDtA0rqpDfIx9sr8CRcAuAQnjiLEoDsmlpwj2glvGUp4kPGXZrd9FtqarJLvzvCjLIuf3bKNryLYUJ2T8UdWU1tWDs3Bl9VAicZpXtO26llZ5Gq8BBn7Ei7r1msZr64JHvoCYJSXtGtdtOlomDP+F0uh8C1AZfbSzIOfhK5IMOftGX+HP0Ai6f9Q8iu7C0nIQIp8HS8LnDE3wdL54+/xtfjxP6lI2NhnQ0HwAAAAASUVORK5CYII=);\n}\n.wemo_insight .row-tile .powerIndicator[data-indicator="off"] {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAABGdBTUEAALGPC/xhBQAAAR1QTFRFmpqaiYmJfn5+f39/mJiYiIiIl5eXkpKSlpaWj4+Ptra2tLS0bGxsfX19VFRUg4ODYWFhhISELy8vp6enf39/SUlJRkZGWFhYPz8/paWlDw8Pt7e3AAAAnp6eq6uroqKigICApKSkjIyMmZmZrKyso6Ojvb29iIiIra2tkZGRrq6unJycsLCwlZWVpqamioqKv7+/j4+Ps7OzmJiYi4uLkJCQoaGhl5eXmpqan5+foKCgwsLCz8/PlpaWu7u7sbGxtbW1paWlh4eHqKiovLy8ycnJuLi4tLS0xMTEx8fHzc3Nt7e3srKywcHBw8PDvr6+1tbW29vbxsbGy8vLwMDAyMjI0NDQxcXFzMzMysrK09PT1NTU2NjY0dHRzs7OJPKKDwAAAB10Uk5TwPDw8HDwwFBwUK+vsPBwwHBwEO9QUFBwEG8Q7wCnwIwGAAABDElEQVQY023Q1W7DQBAFUJcpzLHbpswU5sTMkJhx//8zmnWtyJVyX0Y60mpnLnK5I8jfQHOZ7E02k0NTWNsne+1++448qG2xTvbvx7cEMRm9PtcTrH7PBw+yxErcy2O3V40RPRp+ybTiCLr6hFOjPRRi4ZPgTMEF9gwwU4kaFiDmJx+a4EZ+EPgzT+m08hDnFOsYtr8Kw5UPLPq6C/H9TbNAFITrdRhErilfQRwvzRSq+ADisWwyYvLcdnkcgVhcaroB4o8iwCidIsRSeeF4m42iyAaupZVL8UUVznQ8QwRANKypVEluP2UVx/I20dXF4balM+xH5XWHN7GTVJ+N5gVGY+fNRrrknc3/zy8HwU3m7KKUiAAAAABJRU5ErkJggg==);\n}\n.wemo_insight .thresholdContent .autoResetBtn {\n    margin-top: 0;\n}\n.wemoModal .dwwr {\n    height: 100%;\n}\n.wemoModal .dwwo {\n    position: absolute;\n    z-index: 3;\n    top: 0;\n    left: 0;\n    width: 100%;\n    height: 100%;\n    background: -webkit-gradient(linear, left bottom, left top, from(#ffffff), color-stop(0.45, rgba(255, 255, 255, 0.2)), color-stop(0.58, rgba(255, 255, 255, 0.2)), to(#ffffff));\n    background: -webkit-linear-gradient(#ffffff, rgba(255, 255, 255, 0.2) 45%, rgba(255, 255, 255, 0.2) 58%, #ffffff);\n    background: -moz-linear-gradient(#ffffff, rgba(255, 255, 255, 0.2) 45%, rgba(255, 255, 255, 0.2) 58%, #ffffff);\n    background: linear-gradient(#ffffff, rgba(255, 255, 255, 0.2) 45%, rgba(255, 255, 255, 0.2) 58%, #ffffff);\n    pointer-events: none;\n}\n.mobiWatts.wemoModal .dwc {\n    margin-top: 0.5em;\n    padding: 0;\n}\n.mobiWatts.wemoModal .dwwol {\n    position: absolute;\n    top: 35%;\n    left: 0;\n    width: 100%;\n    height: 33%;\n    z-index: 1;\n    border-top: 1px solid #cccccc;\n    border-bottom: 1px solid #cccccc;\n    pointer-events: none;\n}\n.mobiCost.wemoModal .dwwol {\n    position: absolute;\n    top: 33%;\n    left: 0;\n    width: 100%;\n    height: 34%;\n    z-index: 1;\n    border-top: 1px solid #cccccc;\n    border-bottom: 1px solid #cccccc;\n    pointer-events: none;\n}\n.mobiWatts.wemoModal .dwwl0 > .dwwol:after {\n    position: absolute;\n    width: 40px;\n    left: 163px;\n    color: #73d44c;\n    font-weight: 400;\n    font-size: 32px;\n    text-align: center;\n    line-height: 48px;\n    content: \'W\';\n}\n.mobiCost.wemoModal .dwwl1:before {\n    content: \'\';\n}\n.mobiCost.wemoModal .dwwl1 > .dwwol::before,\n.mobiCost.wemoModal .dwwl2 > .dwwol::before,\n.mobiCost.wemoModal .dwwl3 > .dwwol::before {\n    position: absolute;\n    top: 0;\n    left: -0.2em;\n    color: #73d44c;\n    font-size: 1em;\n    text-align: center;\n    content: \'.\';\n    display: none;\n}\n.mobiCost.wemoModal .dwwl1 .dwwol.show::before,\n.mobiCost.wemoModal .dwwl2 .dwwol.show::before,\n.mobiCost.wemoModal .dwwl3 .dwwol.show::before {\n    display: block;\n}\n.mobiWatts.wemoModal .dw-i {\n    padding: 0 100px;\n}\n.wemoModal .dwbg .dwv {\n    border: none;\n    color: #595959;\n    font-size: 1.4em;\n    font-weight: 500;\n}\n.mobiWatts .dwbg,\n.mobiCost .dwbg {\n    left: 0;\n    bottom: 0;\n    width: 100%;\n    height: 19em;\n}\n.wemoModal .dwwc {\n    padding: 2em 2em 3.2em;\n}\n.mobiWatts.wemoModal .dwwl0 .dw-sel {\n    margin-top: 3px;\n}\n.mobiCost.wemoModal .dwwl .dw-bf {\n    margin-top: -5px;\n}\n.mobiCost.wemoModal .dwwl .dw-sel {\n    margin: 6px;\n}\n.mobiCost.wemoModal .dwwc {\n    padding: 1.1em 2em 2.3em;\n}\n.mobiCost.wemoModal .dwcc {\n    margin-top: 0.5em;\n}\n.dw-timespan .dw-i {\n    font-size: 1.7em;\n}\n.wemoModal .dwwl2 .dw-i {\n    margin: 0;\n    padding-left: 0;\n    font-size: 1.75em;\n    font-weight: 600;\n}\n.wemoModal .dwbw {\n    position: absolute;\n}\n.wemoModal .dwbc .dwb-s {\n    width: 30%;\n    height: 1em;\n    top: 0;\n    right: 0;\n}\n.wemoModal .dwbc .dwb-c {\n    top: 0;\n    left: 0;\n}\n.wemoModal .dwbg .dwb {\n    width: 30%;\n}\n.wemoModal .dwbw.dwb-s .dwb {\n    float: right;\n    padding: 0.6em 0.5em 0 0;\n    border: none;\n    background-color: #ffffff;\n    font-size: 18px;\n    font-weight: normal;\n    text-decoration: none;\n}\n.wemoModal .dwbw.dwb-c .dwb {\n    float: left;\n    margin: 0.9em;\n    border: none;\n    background-color: #ffffff;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAMAAAC7IEhfAAAABGdBTUEAALGPC/xhBQAAADxQTFRFVVVVVlZWVVVVVVVVVFRUVFRUVlZWVVVVTExMVFRUVFRURkZGVVVVVVVVVVVVVVVVVVVVTExMAAAAVVVVwyt4fwAAABN0Uk5TbEdrSL5eU/wKu1v99kJ4Tmn6AAfDaz0AAADKSURBVDjLndXJEoMgEARQkriwuDb//68JgoII2hUuHHhVFDDTCEil8TC0khCyseZBamMbKZS11rR3rjU/ooR2k13qbnHrRgs8yOAggG69kZtbOziIuS69m+FhXUbnYU0mLsCyTN0OgxSpe6fugEFO0U0nF2EuM5dAfIZEbm54oQQxRundiDKM8urOcJcFl8EgCy6Hh8zdBWLsnetz9z9kt2YPw14Pe+HsE7JFwZYZW7hsK7DNxbYrGwBspLAhxcYeHaR0NNNhz34fXzHIbK1CxRi5AAAAAElFTkSuQmCC);\n    background-repeat: no-repeat;\n    background-size: 26%;\n    font-size: 18px;\n    font-weight: normal;\n    text-indent: -9999px;\n}\n.wemo_insight.wemo_edit_device section.content .title,\n.wemo_insight.costPerKwhPage section.content .title,\n.wemo_insight.dataExportPage section.content .title,\n.wemo_insight.thresholdPage section.content .title {\n    font-size: 2em;\n}\n.notification_inner.selectPopup {\n    background-color: #ffffff;\n}\n.notification_inner.selectPopup .header {\n    padding: 1.3em 1.1em;\n    border-bottom: 1px solid #595959;\n}\n.notification_inner.selectPopup .message {\n    padding: 0;\n    height: 8.2em;\n    overflow-y: auto;\n}\n.notification_inner.selectPopup .selectOption p {\n    float: left;\n    margin: 0 0 0 1.5em;\n    padding: 0.6em 0;\n    width: 89%;\n    text-align: left;\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABECAMAAAAPzWOAAAAABGdBTUEAALGPC/xhBQAAALFQTFRFYN0AYtQAYdsAY9sAYNwAXNwAYNsAYNsAYtwAXtoAX9wAYNsAYt0AYtwAYdwAX98AXtsAYtwAZt0AAAAA0/W48vzpuvCPdOAcsu6C7fvh5vrWxsbG09PTv7+/zfStw/Kdl+hWnupi2PfA6enp2dnZ8fHx+P3zkOdKzMzM39/f9PT0+v72fOIrqOxxh+U8/f/79/f35eXl3/jK/Pz87e3tat4M+vr6ZN0DY9wB////8vLyINeWMgAAABR0Uk5TNfa6QLEWpMmEI+OXS1huCNjsDwB5EBJIAAADzElEQVRYw6WYZ5uyOhCGWbuitHXtx+5ioVjADPz/H3Ym6JsEFjTszjcF7mtaknmifBZZvac2TXia2VS7euGrSsHfKvueW6fVlofUNQM/IaGzHKy//Cj6nsxHSyekHKMnB7E0dII47vUUpe26ohxTs95DeogIl+ssITF/bRP05kd2MpB2hSImUaFNluhOw3oFQTeId41e2tVDb6rFEBVguDhF72yBlJaVD6k3ALxJJGETD0PS8yCYDrKK5OxrRaBm5UCaEI6+I1lzCVSsLMSqAVlkXrxftvv/EttvL/f0s9OIgJqFtABGvvjW7bKn3wa7ON4FlLa/3LK+tNKQLoCbcuIwnV3ilF1m04PozvcKoCtC6h/giaXdTLdB/MOC7XQjUhzotDlEr0Eo1PY22+cgEsx+JsR0HUKNQ3pABvzZeXqIC+0wPfM3B+QREIXUDfD4k3i6iV/YZhrzgDww9SdEg5Cvl3NRKDwk7suVQO8B0TvAO/X2jkEpLC++DR09gWhiVmeb+K1tZtyVkGYFIQbYvLaHWMIOvNIeVCikDaTPemwWS9mMdd2cQBshKgxZnx0COUhwYGtoCBpCTN7wt20saVuW2xUYn4oFwOp7CWQhweXfN30CloLdylavtCPoCms4rI/SAIfvH/IQvr840FKasGT1jUsYq7INFcWEEatNGQirjwuGAjD/G2RBTISMWXHKQFh51gQQwlo4KAMJ2PGRhuzKQHZsJachcSljjZ9Avv8GGSeQyd/CeSR2/jfIgnyIzfa76tBmE9r+dxAbaooqLMAykNQC7ELIanyUZxyFrUBRdGFT2v0ir7jJ6spnR9ge5SFse1xCM9moQ790PCyaKEw26jZAv3Rq+ZEBYGUPr7Mcg53GvoPRUAhu1eNylOyJTqcCUzzQJdJy5IMOHuh5o8W9RELo4nuOFp9Wasi5yzNOHh5//8atbmqGvb+M6ChMkIOnUngMfg0ggra4vcjuWRj81iE0xBEUpcFXJBGSOMiOHTDr4jBcBUiJg3xnzqmZ2mayh4/lxE0pnVs2Ncd7CuG7gA2fEQiYllFWStzPT9DxfM/KwVWOQKBTNXFLSZWG9VPvWCialpKUMeajkSvfLCoBrzKMtQOgWgVCUqNC8q0zp0HIc5ojabsdKmn9Vwi/j5LW7L4U1zWU+HZxTA+NrrbfyPxqBzW6N89Xx3OHyvyqxK2FhhgyXPUzyfmaU4UPnZ7c1Yfeaz6uPmx3cR37p/F64dpOiE5As1viEqbdMpJ7F/K05EdTq5e6yaH+KK2K8fG4w/kwaq1q8XXQ/1NPTX8QC6AGAAAAAElFTkSuQmCC);\n    background-repeat: no-repeat;\n    background-position: 96% 46.8%;\n    background-size: 9%;\n}\n.notification_inner.selectPopup .selectOption.active p {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAABECAMAAAAPzWOAAAAABGdBTUEAALGPC/xhBQAAASZQTFRFXdQAYN0AYdsAYtwAYs8AYd0AYtsAYdsAYtwAYtwAYtwAYtsAX9wAYtYAYNsAYtwAYdsAYNwAYtwAYNsAZuAAYdsAX9wAYtwAY9oAYtwAYtoAVdQAatQAaeEAAAAA4fnO1efYksWVpc6olMaVYrxNp8+pjsiIn9mQgMpwkdl3pOtrufCNX8FDWLtAt+ek9fr1vOK2bLhliNpnedZUc81V0/W4qex0yfOo1/a9VKxM4e7ke7t8XbBVTrE8S6ZGZcdGPaA2lN93ze/Bp+SPqOxxdOAc+v74su6C5fnYzPOymOhX9f3vwfKahOQ3stS1b9FKnuph2/fF/v/8ieU/7vvj6fPp3/jLe+IpkedMbM5IgNhd+f708/j0at4NZN0DYtwA////c9RMT+sGTgAAAB90Uk5T8DWlq/c8XYjAlKOB2+lHaHMlmckZVuPsTdW1BgwRAA9idTMAAAQvSURBVFjDpZjneuo4EIadnDRCQu+Y7OklvRwCCQFCCy2E3rHGvv+bWBmCJDu2kXe/fwL5fWak0WhGwomZAkGHPwzvCvsdrrjpVMH45y3HMXxQyOnlhyTcUfwJksaNs/SgJ8vzWr3aGEsq5yjIBxE92Ak0LndfZK26HZUTdic2Q4LYD2mS1hOWeklPEEA0EreGeA8wolGTTVVrYHO2ExaQeFAA1PpHtlS3j61xmUN8AJXUXN6kV0xxisaQwCeAVk3mUK0FcBg3ggQOAHVkPg06CGIJA4gfpOpc5tU9S1lDEjFAr7qJw7fMTe4ZK3eTeRtq/5tXEfj0kH2Aao+dtfj69Jy9yE/bitKe5i+yz09fF3pb9uMaSASgrEF8yWXzikb5bO4Li5l3ACIsJLADfXY93nIXbeWD2he5N5YyhpCXQuIxkJgQW2SyU8VQ02yGMWZUgU8UEtQs6uPDuWKq84dHOvMMrRxSIYkj6NN/Pj9MFQtNHz6Tqc0+HMffIR6QRowdlgyVQm3pIthbQcQQ0EhdPG1gYMoTWZfeBELiEuIGiZ6YzEYGpmTo2krqqmBIFCZ0b88VDp3Tne7DgQrxAkpSZxQuUYdSCAIY4oMKibNvUz7I9BuJuAp4MCRMA37xXeHUd2JKB6IngghA9vdHmxfS/rH+JokgIewBIqf3RuHWDQk4CVzCNoxJ/sjzQ/Ikv4xhX4hCg+yvYkNklycQE8JQXQ9/2oH8XH9VhiMBoL4e/rYD+U0vEAFDBuvhXzuQv8whxBD5/0EGWkjbDqRNbnktRLElEvhLCDk5d3YYd1p3SDKZ2YHM1l+llxCyxX/sQP7QLd5hg+2XHcgvNtj8NOyv7UCu2bB3MAfQDoQ5gE4hAhLZ4wI/o0B2WIItTVK6/g/e1BGIwskxnJL0yL3JM5IeG+DHOdYBEkltl7yQS7IE0jJRewGSdk2hhqQAEvrLq8gHKZJ7tIW9USE4VZOUIpd4GCV6jSIIrqqCMHuh325m3NJCB1/oRqXFcOOyzIZsaRE0LHIeN1BmtDyZt/D1ty63Ippya2jp0S1T0J4B7NLC7xDQiCn8LFa3xBR+aQm22RIUtwZNprosmrg0K7IF/hiOA2wx7ALQNAdXlwaY2eUVO2fy7gxblqN7TXtwVded6UJdg3gpA7h1tb2Il6WqaxCaxVJhhrP33axQKjZ17eCpQYOgVtU6WyxVRnAofux31Gal0eRsmvB6HBq2bwm1BRzxMLpjAJ9o0kh6MOV1o0vzM4muqUFfHAkB6o96VohesoUg7LJsrnFHijHmiGWP7gtsaPNdapvfN+mO6y21zd/leLVwh7A1lU5St1PN1ER9cAgF+Z4+xD3/6uljcp/qDl7mg+7r6WQsYSPgIBLnf4TxOqPLdxf0ruXA70nYeslRQ3jLGTvaWb3h7ERjzl3RdOq/rCuJjk+vDyQAAAAASUVORK5CYII=);\n}\n';});

define('widgets/wemo_insight/js/model',['Cache'],
    /** @exports model class and instantiated model */
    function(Backbone) {
        'use strict';

        var mockPath = 'widgets/wemo_insight/mocks/';

        var Model = Backbone.WemoDeviceModel.extend({
            /**
             * default data values
             */
            defaults: {
                'binaryState': 0,
                'onFor': 160, // On now for:, Last on for: value
                'past14TotalTime': 0,
                'tttOn': 1200, //On today
                'past14DaysKwh': 0,
                'stateChangeTS': 0,
                'offSince': 0, // Since date
                'sinceLabel': '',
                'onForLabel': '',
                'powerThreshold': 0,
                'timeConnected': 382069,
                'hrsConnected': 0,
                'todayTotalKwh': 0,
                'onAvg': 1,
                'avgPowerON': '- -',
                'powerNow': 0,
                'monthlyCost': 0,
                'energyPerUnitCost': 0,
                'currency': 1,
                'countDownLabel': '',
                'ruleAutoOffTime': 0,
                'emailAddress': '',
                'dataExportType': '2',
                'defaultEnergyPerUnitCost': 0,
                'defaultCurrency': 1,
                'defaultExportEmail': '',
                'defaultEmailInterval': 2,
                'defaultPowerThreshold': 8000,
                'defaultFriendlyName': '',
                "defaultIcon": "file:///android_asset/www/img/new_icons/WeMo_Insight_Switch_@3x.png"
            },
            /**
             * validate fields for do save
             */
            editArray: [],
            /**
             * validation fields, uses Backbone.validation
             */
            validation: function() {
                var self = this;
                return {
                    'binaryState': {
                        required: true
                    },
                    'tttOn': {
                        required: true
                    },
                    'onFor': {
                        required: true
                    },
                    'past14TotalTime': {
                        required: true
                    },
                    'past14DaysKwh': {
                        required: true
                    },
                    'stateChangeTS': {
                        required: true
                    },
                    'powerThreshold': {
                        required: true
                    },
                    'timeConnected': {
                        required: true
                    },
                    'hrsConnected': {
                        required: true
                    },
                    'avgPowerON': {
                        required: true
                    },
                    'todayTotalKwh': {
                        required: true
                    },
                    'powerNow': {
                        required: true
                    },
                    'energyPerUnitCost': {
                        required: true
                    },
                    'currency': {
                        required: true
                    },
                    'ruleAutoOffTime': {
                        required: true
                    }
                }
            },
            /**
             * data of default cost according to currency
             */
            defaultCost: {
                '1': 111,
                '3': 135,
                '4': 256,
                '7': 17180,
                '10': 21550,
                '13': 120000,
                '15': 2259
            },
            /**
             * return basic info from the device
             */
            getInformation: function() {
                var info = {
                    'udn': this.baseObject.information.udn
                };

                return info;
            },

            /**
             *  set the native get command
             */
            getCommand: 'GetInsightParams',

            /**
             *   set the native command
             */
            setCommand: 'SetBinaryState',
            saveAction: function(variable) {
                return this.save(variable);
            },
            /**
             * urls, statusUrl, and rulesUrl all allow dummy data to be loaded for demo/test
             * @returns {string}
             */
            url: function() {
                return mockPath + 'device.json';
            }
        });

        return {
            Model: Model,
            model: new Model() //we need to pass a shared model, but we want the base object available for unit testing
        };
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_insight/templates/tile',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<header class=\"row-tile\">\n    <div class=\"tile1\">\n        <div class=\"gradient\"></div>\n        <span class=\"icon\" data-bind=\"iconURL\"></span>\n    </div>\n    <div class=\"tile2 description\">\n        <h1 data-bind=\"friendlyName\"></h1>\n        <span class=\"countDownTimerRule status\" data-bind=\"countDown\"></span>\n        <div class=\"drawerArrow closed\" aria-hidden=\"true\"></div>\n    </div>\n    <div class=\"powerIndicator\" data-indicator=\"off\"></div>\n    <div class=\"tile3 power\"></div>\n</header>";
  });
Handlebars.registerPartial('widgets_wemo_insight_templates_tile', t);
return t;
});
/* END_TEMPLATE */
;
define('mixins/tile.countdownTimer',[], function() {
    'use strict';

    function updateCountDown() {
        var countdownEndTime = parseInt(this.model.get('ruleAutoOffTime'), 10),
            auxTime = new Date(countdownEndTime * 1000),
            correctTime,
            currentTime = Math.round(new Date().getTime() / 1000.0),
            leftTime;

        correctTime = Math.round(auxTime.getTime() / 1000.0);
        leftTime = correctTime - currentTime;

        if (correctTime !== 0 && leftTime > 0) {
            var hours = Math.floor(leftTime / 3600),
                minutes = Math.floor((leftTime - (hours * 3600)) / 60),
                seconds = leftTime - (hours * 3600) - (minutes * 60),
                strData = '',
                self = this;

            if (hours >= 1) {
                if (minutes === 0) {
                    strData = hours + 'h';
                } else {
                    strData = hours + 'h' + ' ' + minutes + 'm';
                }
            } else if (minutes >= 1) {
                strData = minutes + 'm';
            } else {
                strData = seconds + 's';
            }

            this.model.set('countDownLabel', this.sandbox.i18n.t('labels.autoOff') + ' ' + strData);

            if (!this.countDownInterval) {
                this.countDownInterval = setInterval(function() {
                    updateCountDown.apply(self);
                }, 1000);
            }
        } else {
            if (this.countDownInterval) {
                this.model.set('countDownLabel', '');
                clearInterval(this.countDownInterval);
                this.countDownInterval = false;
            }
        }
    }

    var exports = {
        updateCountDown: updateCountDown
    };


    return exports;

});
define('extensions/ui/powerButton', ['backbone'], function(Backbone) {

    'use strict';


    var PowerButton = Backbone.View.extend({
        events: {
        },

        initialize: function(options) {
            _.extend(this, options);
            this.isRendered = false;
            this._state = -1;
        },

        setState: function(state){
            if(state === this._state) return;

            var self = this;
            var _setState = function(){
                self.$('.powerState').attr('class', 'powerState powerState-' + state);
                self._state = state;
            };

            _setState(state);
        },

        render: function(){
            if(!this.isRendered){
                this.$el.html('<div class="powerState powerState-0" data-bind="modeIcon" aria-live="polite" aria-atomic="true" role="button"><div class="powerStateSpinner"></div></div>');
                this.$('.powerState').on('click', this.onTap);
                this.isRendered = true;
            }
        }
    });

    PowerButton.MODE = {
        MODE_OFF: 0,
        MODE_ON: 1,
        MODE_SEARCHING: 2
    };

    return PowerButton;

});

define('widgets/wemo_insight/js/tile',['backbone', 'hbs!widgets/wemo_insight/templates/tile', 'mixins/tile.countdownTimer', 'extensions/ui/powerButton'],
    /** @exports tile view */
    function(Backbone, template, countdownTimer, PowerButton) {
        'use strict';

        //will store the settings for when we start cycling the power button.

        var View = Backbone.TileBaseView.extend({
            template: template,
            isBeingSaved: false,

            /**
             * adds event binding to elements, clicks are converted to pointerup events
             */
            events: {
                'click .description': 'setToggle'
            },
            /**
             * two-way data binding to models, uses Backbone.stickit
             */
            bindings: {
                '*[data-bind="friendlyName"]': {
                    observe: 'friendlyName',
                    updateMethod: 'html'
                },
                '*[data-bind="countDown"]': {
                    observe: 'countDownLabel',
                    onGet: function(val) {
                        return val;
                    }
                }
            },
            /**
             * Binds DOM events
             */
            render: function() {
                this.delegateEvents();
                this.renderPowerButton();
                this.changeButtonUI();
                this.updateAria();
                countdownTimer.updateCountDown.call(this);
            },

            renderPowerButton: function(){
                this.powerButton = new PowerButton({
                    $el: this.$('.power'),
                    onTap: this.setMode.bind(this)
                });
                this.powerButton.render();
            },
            /**
             * Called when there is a change on the insight state
             */
            setMode: function() {
                var state = parseInt(this.model.get('binaryState'), 10),
                    newState;

                if (!this.isBeingSaved) {
                    this.powerButton.setState(PowerButton.MODE.MODE_SEARCHING);

                    if (state === 0) {
                        newState = 1;
                    } else {
                        newState = 0;
                    }

                    this.isBeingSaved = true;
                    this.model.set('binaryState', newState);
                    this.model.saveToCache();
                    this.model.saveAction(['binaryState']).done(this.successSaveAction).fail(this.failSave);
                }
            },
            /**
             * Logic to change tue UI of the power button
             */
            changeButtonUI: function() {
                var mode = parseInt(this.model.get('binaryState'), 10);

                if (!this.isBeingSaved) {
                    switch(mode){
                        case 0:
                            this.powerButton.setState(PowerButton.MODE.MODE_OFF);
                            this.$(".powerIndicator").attr("data-indicator", "off");
                            break;
                        case 1:
                            this.powerButton.setState(PowerButton.MODE.MODE_ON);
                            this.$(".powerIndicator").attr("data-indicator", "on");
                            break;
                        case 8:
                            this.powerButton.setState(PowerButton.MODE.MODE_ON);
                            this.$(".powerIndicator").attr("data-indicator", "standby");
                            break;
                        default:
                            this.powerButton.setState(PowerButton.MODE.MODE_OFF);
                            this.$(".powerIndicator").attr("data-indicator", "off");
                            break;
                    }
                }
            },
            updateAria:function(){
                var mode = parseInt(this.model.get('binaryState'), 10),
                    modeString = (mode === 0 ? "off": "on"),
                    friendlyName = this.model.get('friendlyName'),
                    productName = this.model.get('defaultFriendlyName');

                this.$('.tile1').attr('aria-label', productName);
                this.$('.tile2').attr('aria-label', friendlyName);
                this.$('.powerState').attr('aria-label', friendlyName + " power is " + modeString);

                this.$(".powerIndicator").attr("aria-label", "Power Indicator status is " + (mode === 8 ? "standby": modeString));
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:binaryState', this.changeButtonUI);
                this.listenTo(this.model, 'change:binaryState', this.updateAria);
                this.listenTo(this.model, 'change:friendlyName', this.updateAria);
                this.listenTo(this.model, 'change:powerThreshold', this.changeButtonUI);
                this.listenTo(this.model, 'change:powerNow', this.changeButtonUI);
                this.listenTo(this.model, 'change:ruleAutoOffTime', countdownTimer.updateCountDown);
            },
            /**
             * Set behaviour for open, close drawer
             */
            setToggle: function(event) {
                this.accordion.toggle(this.$('.description'));
            },
            /**
             * Logic to set up the button to show/hide drawer cross-platform
             */
            afterInitialize: function() {
                var element = this.$('.noVisble');
                this.sandbox.uiInterface.setShowHideDrawer.call(this, element);
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log(resp);
                if (resp.binaryState) {
                    this.model.set('binaryState', resp.binaryState);
                }
            },
            /**
             * Function that hide loading spinner after save action
             */
            afterSave: function() {
                this.isBeingSaved = false;
                this.changeButtonUI();
            }
        });

        return View;
    });

/* START_TEMPLATE */
define('hbs!widgets/wemo_insight/templates/summary',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<div class=\"drawerContent\">\n    <section class=\"content\" style=\"padding: 0;\">\n        <div class=\"mainContent\">\n            <span class=\"stopwatchIcon\"></span>\n\n            <div class=\"firstContent\">\n                <div class=\"ui-block-a\" aria-hidden=\"true\">\n                    <span class=\"state_duration_text\" data-bind=\"onLabel\"></span>\n                    <span class=\"duration\" data-bind=\"onForDuration\"></span>\n                    <span class=\"seconds\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "timeUnit.0", options) : helperMissing.call(depth0, "i18n", "timeUnit.0", options)))
    + "</span>\n                    <span class=\"duration durationAux\"></span>\n                    <span class=\"unitAux\"></span>\n                </div>\n                <div class=\"ui-block-b\" aria-hidden=\"true\">\n                    <span class=\"off_since_text\" data-bind=\"sinceLabel\"></span>\n                    <span class=\"off_since_time\" data-bind=\"offSinceDuration\"></span>\n                </div>\n            </div>\n        </div>\n        <div class=\"secondContent\" aria-hidden=\"true\">\n            <div class=\"dayInfo\">\n                <div class=\"ui-block-c\">\n                    <span class=\"on_today\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.onToday", options) : helperMissing.call(depth0, "i18n", "labels.onToday", options)))
    + "</span>\n                    <span class=\"on_avg_day\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.onAvgDay", options) : helperMissing.call(depth0, "i18n", "labels.onAvgDay", options)))
    + "</span>\n                </div>\n                <div class=\"ui-block-d\">\n                    <span class=\"on_today_time\" data-bind=\"onToday\"></span>\n                    <span class=\"on_avg_time\" data-bind=\"onAvg\"></span>\n                </div>\n            </div>\n        </div>\n        <div class=\"thirdContent\">\n            <span class=\"dollarIcon\"></span>\n\n            <div class=\"estimatedDollars\" aria-hidden=\"true\">\n                <div class=\"ui-block-e\">\n                    <span class=\"estimated_monthly\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.estimatedMonthly", options) : helperMissing.call(depth0, "i18n", "labels.estimatedMonthly", options)))
    + "</span>\n                    <span class=\"estimated_today\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.today", options) : helperMissing.call(depth0, "i18n", "labels.today", options)))
    + ":</span>\n                </div>\n                <div class=\"ui-block-f\">\n                    <span class=\"estimated_monthly_val\">\n                        <span data-bind=\"currency\"></span>\n                        <span class=\"monthly\" data-bind=\"monthly\"></span>\n                    </span>\n                    <span class=\"estimated_today_val\">\n                        <span data-bind=\"currency\"></span>\n                        <span class=\"today\" data-bind=\"today\"></span>\n                    </span>\n                </div>\n            </div>\n        </div>\n        <div class=\"fourthContent\">\n            <span class=\"lightIcon\"></span>\n\n            <div class=\"estimatedUsage\" aria-hidden=\"true\">\n                <div class=\"ui-block-g\">\n                    <span class=\"avg\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.avg", options) : helperMissing.call(depth0, "i18n", "labels.avg", options)))
    + "</span>\n                    <span class=\"now\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "labels.now", options) : helperMissing.call(depth0, "i18n", "labels.now", options)))
    + "</span>\n                </div>\n                <div class=\"ui-block-h\">\n                    <span class=\"avg_value\" data-bind=\"avg\"></span>\n                    <span class=\"now_value\" data-bind=\"now\"></span>\n                </div>\n            </div>\n        </div>\n    </section>\n</div>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_insight_templates_summary', t);
return t;
});
/* END_TEMPLATE */
;
define('libs/execHandler',[], function() {
    var ExecHandler = function() {
        this.initialize.apply(this, arguments);
    };
    if (!window.smartDevicePlugin) {
        window.smartDevicePlugin = {};
    }

    window.smartDevicePlugin.callbackList = {};
    window.smartDevicePlugin.onDeviceChanged = function(id, resp) {
        //find the device, fire off the first callback in the array, then get rid of it.
        DEBUG && console.log('ExecHandler:onDeviceChanged:RESPONDED:' + id);


        var callback = window.smartDevicePlugin.callbackList[id];
        if (callback && id) {
            if (callback.length > 0) {
                var self = callback[0];
                clearTimeout(self.timeout);

                if (typeof resp == 'string') {
                    resp = JSON.parse(resp);
                }

                if (((self.action == 'setDeviceState' || self.action == 'setGroupState') && resp.onDeviceUpdated) || (!resp.onDeviceUpdated && resp.success === 'true') || (self.action == 'setDeviceProperties' && resp.success === 'true')) {
                    DEBUG && console.log('ExecHandler:useWindowMethod:SUCCESS:' + self.plugin + ':' + self.action + ':' + JSON.stringify(resp));
                    if (self.callback) {
                        self.callback(resp);
                    }
                    self.dfd.resolve(resp);
                } else {
                    DEBUG && console.log('ExecHandler:useWindowMethod:ERROR:' + self.plugin + ':' + self.action + ':' + JSON.stringify(resp));
                    self.dfd.reject(resp);
                }

                callback.splice(0, 1);
            }
        }
    }

    ExecHandler.prototype = {
        constructor: ExecHandler,
        initialize: function(options) {
            _.bindAll(this);
            options = options || {};
            _.extend(this, options);
            this.dfd = new $.Deferred();
            this.timeout = setTimeout(function() {}, 0);

        },
        success: function(resp) {
            if (!this.useWindowMethod) {
                DEBUG && console.log('ExecHandler:SUCCESS:' + this.plugin + ':' + this.action + ':' + JSON.stringify(resp));
                if (this.callback) {
                    this.callback(resp);
                }
                this.dfd.resolve(resp);
            }
        },
        initWindowMethod: function() {
            //create an array of callbacks to this device.

            if (!window.smartDevicePlugin.callbackList[this.useWindowMethod]) {
                window.smartDevicePlugin.callbackList[this.useWindowMethod] = [];
            }

            window.smartDevicePlugin.callbackList[this.useWindowMethod].push(this);

        },
        error: function(err) {
            if (!this.useWindowMethod) {
                DEBUG && console.log('ExecHandler:ERROR:' + this.plugin + ':' + this.action + ':' + JSON.stringify(err));
                //in cases where device is not reachable, err = {isDiscovered:false}, update this model to cause greyout
                if (this.errorCallback) {
                    this.errorCallback(err);
                }
                this.dfd.reject(err);
            }
        },
        go: function(plugin, action, data) {
            var self = this;
            data = data || [];
            this.plugin = plugin;
            this.action = action;
            DEBUG && console.log('ExecHandler:' + plugin + ':' + action + ':' + JSON.stringify(data));
            this.isRemote = (window.sessionStorage.getItem('isRemote') === "true");
            this.timeoutLimit = 15000;

            if (this.useWindowMethod) {
                this.initWindowMethod();
            }

            if (window.cordova) {
                DEBUG && console.log('ExecHandler:' + plugin + ':' + action + ':sending to Cordova');
                window.cordova.exec(this.success, this.error, plugin, action, data);
            } else {
                if (this.useWindowMethod) {

                    var success = 'true';

                    var jsonString = JSON.stringify({
                        udn: this.useWindowMethod,
                        success: success
                    });
                    window.smartDevicePlugin.onDeviceChanged(this.useWindowMethod, jsonString);
                } else {
                    this.success({});
                }
            }

            if (!this.ignoreTimeout) {
                this.timeout = setTimeout(function() {
                    window.smartDevicePlugin.onDeviceChanged(self.useWindowMethod, {
                        success: false,
                        error: 'timeout'
                    });
                }, self.timeoutLimit);
            }
            return this.dfd.promise();
        }
    }

    return ExecHandler;

});
/** a common API for devices and the browser. the browser version returns mock data for testing, will be used as part of an extension to mixin with the sandbox  **/
define('libs/smartDevicePlugin',['libs/execHandler', 'libs/constants'], function(ExecHandler, Constants) {
    'use strict';

    var callPlugin = function(plugin, action, data, options) {
        var handler = new ExecHandler(options);
        return handler.go(plugin, action, data);
    }

    var exports = {
        /**
         * sends device to Native layer to update state via UPNP or cloud
         * @param {function} callback a callback method to fire on success, if one is defined.
         * @param {JSON object} model [the entire device model]
         * @param {JSON object} data        [contains state attributes]
         * @return {promise}
         */
        setDeviceState: function(callback, model, data) {
            return callPlugin('SmartDevicePlugin', 'setDeviceState', [model.baseObject.information, data], {
                callback: callback,
                model: model,
                useWindowMethod: model.baseObject.information.udn
            });
        },
        setDeviceProperties: function(callback, model, data) {
            return callPlugin('SmartDevicePlugin', 'setDeviceProperties', [model.baseObject.information, data], {
                callback: callback,
                model: model,
                useWindowMethod: model.baseObject.information.udn
            });
        },
        setNightModeConfiguration: function(callback, model, data) {
            return callPlugin('SmartDevicePlugin', 'setNightModeConfiguration', [data], {
                callback: callback
            });
        },
        /**
         * updates the state for all devices in a group
         * @param {Backbone.Model} model the device model
         * @param {JSON} data  the attributes to save
         */
        setGroupState: function(model, data) {
            return callPlugin('SmartDevicePlugin', 'setGroupState', [model.baseObject.information, data], {
                model: model,
                callback: function() {
                    model.trigger('save');
                },
                useWindowMethod: model.baseObject.properties.groupID
            });
        },
        collectEmailId:function(){
            return callPlugin('SmartDevicePlugin', 'collectEmailID');
        },
        /**
         * gets all discovered devices from smartCache
         * @return {promise}
         */
        getDevices: function() {
            return callPlugin('SmartDevicePlugin', 'getDevices');
        },
        getDevicesInfo: function() {
            return callPlugin('SmartDevicePlugin', 'getDevicesInfo');
        },
        /**
         * gets a single device from smartCache (smartCache must get data from device)
         * @return {promise}
         */
        getDevice: function(callback, model, options) {
            return callPlugin('SmartDevicePlugin', 'getDevice', [model.baseObject.information], {
                callback: callback,
                model: model
            });
        },
        checkNestAuth: function () {
            return callPlugin('SmartDevicePlugin', 'nestTokenExistForGivenHomeId');
        },

        getNestDevices: function () {
            return callPlugin('SmartDevicePlugin', 'getNestDevices');
        },
        /**
         * gets updated insight values every 5 seconds from smartCache (smartCache must get data from device)
         * @return {promise}
         */
        getInsightParameters: function(callback, model, options) {
            return callPlugin('SmartDevicePlugin', 'getInsightParameters', [model.baseObject.information], {
                callback: callback,
                model: model
            });
        },
        setInsightDrawerState: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'setInsightDrawerState', [deviceInfo]);
        },
        /**
         * refreshes device list - triggers re-discovery in smartCache
         * @return {promise}
         */
        refreshDevices: function() {
            return callPlugin('SmartDevicePlugin', 'refreshDevices');
        },
        /**
         * adds a device to a group
         * @param  {string} udn     unique device id
         * @param  {string} groupId unique group id
         * @param {boolean} isNewGroup true when creating a new group
         * @return {promise}
         */
        addToGroup: function(bridgeUDN, payload, isNewGroup) {
            if (!isNewGroup) isNewGroup = false;
            return callPlugin('SmartDevicePlugin', 'addToGroup', [bridgeUDN, payload, isNewGroup], {
                useWindowMethod: bridgeUDN
            });
        },
        /**
         * removes a device/devices from a group
         * @param  {string} udn     unique device id
         * @param  {string} groupId unique group id
         * @return {promise}
         */
        removeFromGroup: function(bridgeUDN, groupID) {
            return callPlugin('SmartDevicePlugin', 'removeFromGroup', [bridgeUDN, groupID, false], {
                useWindowMethod: bridgeUDN
            });
        },
        /** removes a device/devices from a group
         * @param  {string} type
         * @param  {json} deviceInfo
         * @param  {json} stateData
         * @return {promise}
         */
        resetDevice: function(type, deviceInfo, stateData, callback) {
            var dataArray = [type, deviceInfo];

            if (stateData !== null) {
                dataArray.push(stateData);
            }
            return callPlugin('SmartDevicePlugin', 'resetDevice', dataArray, {
                callback: callback
            });
        },
        /**
         * set blob storage from device
         * @param {String} udn
         * @param {JSON} data
         * @param {function} callback
         * @return {promise}
         */
        setBlobStorageData: function(udn, data, callback) {

            return callPlugin('SmartDevicePlugin', 'setBlobStorageData', [udn, data], {
                callback: callback,
                useWindowMethod: udn
            });
        },
        /**
         * get blob storage from device
         * @param {String} udn
         * @param {JSON} data
         * @param {function} callback
         * @return {promise}
         */
        getBlobStorageData: function(udn, data,callback) {
            return callPlugin('SmartDevicePlugin', 'getBlobStorageData', [udn,data],{
                callback: callback,
                useWindowMethod: udn
            });
        },
        /**
         * configure Dimming Range.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        configureDimmingRange: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'configureDimmingRange', [deviceInfo]);
        },
        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        adjustIcon: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'adjustIcon', [deviceInfo], {
                callback: callback
            });
        },
        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        choosePhoto: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'choosePhoto', [deviceInfo], {
                callback: callback
            });
        },

        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        takePicture: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'takePicture', [deviceInfo], {
                callback: callback
            });
        },
        /**
         * check if there is Netcam app installed
         * @return {promise}
         */
        checkNetcam: function() {
            return callPlugin('DevicePlugin', Constants.actions.CHECK_NET_CAM);
        },
        /**
         * launch Netcam app
         * @param  {string} item
         * @param  {json} deviceInfo
         * @param  {integer} extraParam
         * @return {promise}
         */
        launchNetcam: function(item, deviceInfo, extraParam) {
            var dataArray = [item, deviceInfo, extraParam];

            return callPlugin('DevicePlugin', Constants.actions.LAUNCH_NET_CAM_APP, dataArray);
        },
        /**
         * check if Bulb devices are connected.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        findBulb: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'findBulb', [deviceInfo]);
        },
        /**
         * remove device disconnected from device list.
         * @param  {json} deviceInfo
         * @return {promise}
         */
        hideDevice: function(deviceInfo) {
            return callPlugin('SmartDevicePlugin', 'hideDevice', [deviceInfo]);
        },
        /**
         * remove device disconnected from device list.
         * @param  {string} groupID
         * @return {promise}
         */
        hideGroup: function(groupID) {
            return callPlugin('SmartDevicePlugin', 'hideGroup', [groupID]);
        },
        /**
         * initiate App recovery mecahnism
         * @return {promise}
         */
        initiateAppRecovery: function() {
            return callPlugin('SmartDevicePlugin', 'appRecovery');
        },
        /**
         * set bulb type
         * @param  {json} deviceInfo
         * @param {function} callback
         * @return {promise}
         */
        setBulbType: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'setBulbType', [deviceInfo], {
                callback: callback
            });
        },
        /**
         * calibrate bulbs for dimmer
         * @param  {json} deviceInfo
         * @param {function} callback
         * @return {promise}
         */
        calibrateBulb: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'calibrate', [deviceInfo], {
                callback: callback
            });
        },
        configHushMode: function(deviceInfo, callback) {
            return callPlugin('SmartDevicePlugin', 'configureHushMode', [deviceInfo], {
                callback: callback
            });
        },
        /**
        * to check if bohnjour present in network
        * @param {function} callback
        * @return {promise}
        */
        checkBohnjour: function(callback){

            return callPlugin('SmartDevicePlugin', 'checkBohnjour',[], {
                 callback : callback
            });
        },

        /**
         * generat auth code
         * @param {function} callback
         * @return {promise}
         */
        getAuthCode: function(callback) {
            return callPlugin('WebServicePlugin', 'getAuthCode', [], {
                callback: callback
            });
        },
        /**
         * generat auth code
         * @return {promise}
         */
        openAlexa: function() {
            return callPlugin('DevicePlugin', '9106', []);
        },
        /**
         * Smart device uuid
         * @return {promise}
         */
        getUUID: function(callback) {
            return callPlugin('DevicePlugin', '6004', [],{
                callback: callback
            });
        },
        getRemoteAccess: function(callback) {
            return callPlugin('DevicePlugin', '6002', [],{
                callback: callback
            });
        },
        getAnalyticsData: function(callback) {
            return callPlugin('NativeUtilPlugin', '6006', [],{
                callback: callback
            });
        }
    };

    return exports;
});

define('widgets/wemo_insight/js/summary',['Cache', 'hbs!widgets/wemo_insight/templates/summary', 'libs/smartDevicePlugin'],
    /** @exports summary view */
    function(Backbone, template, smartDevicePlugin) {
        'use strict';

        var View = Backbone.DrawerBaseView.extend({
            template: template,

            events: {},
            /**
             * two-way data binding
             */
            bindings: {
                '*[data-bind="onForDuration"]': {
                    observe: 'onFor',
                    onGet: function(val) {
                       return this.timeOnFor(val);
                    }
                },
                '*[data-bind="sinceLabel"]': {
                    observe: 'sinceLabel',
                    onGet: function(val) {
                        return this.i18n('labels', val);
                    }
                },
                '*[data-bind="onLabel"]': {
                    observe: 'onForLabel',
                    onGet: function(val) {
                        return this.i18n('labels', val);
                    }
                },
                '*[data-bind="offSinceDuration"]': {
                    observe: 'offSince',
                    onGet: function(val) {
                        return val;
                    }
                },
                '*[data-bind="onToday"]': {
                    observe: 'tttOn',
                    updateMethod: 'html',
                    onGet: function(val) {
                        return this.formatTimeValue(val);
                    }
                },
                '*[data-bind="onAvg"]': {
                    observe: 'powerNow',
                    updateMethod: 'html',
                    onGet: function(val) {
                        return this.estimatedAvgDay(val);
                    }
                },
                '*[data-bind="currency"]': {
                    observe: 'currency',
                    updateMethod: 'html',
                    onGet: function(value) {
                        var arr = [1, 3, 4, 7, 10, 13, 15],
                            currency;

                        if (arr.indexOf(parseInt(value, 10)) === -1) {
                            value = 1;
                            this.model.set('currency', value);
                        }

                        return this.i18n('currency.' + value);
                    }
                },
                '*[data-bind="monthly"]': {
                    observe: 'powerNow',
                    onGet: function() {
                        return this.estimatedMonthlyCost();
                    }
                },
                '*[data-bind="today"]': {
                    observe: 'todayTotalKWH',
                    onGet: function() {
                        return this.todayCost();
                    }
                },
                '*[data-bind="avg"]': {
                    observe: 'timeConnected',
                    updateMethod: 'html',
                    onGet: function() {
                        return this.averagePower();
                    }
                },
                '*[data-bind="now"]': {
                    observe: 'powerNow',
                    updateMethod: 'html',
                    onGet: function() {
                        return this.powerNow();
                    }
                }
            },
            /**
             * localizes the template, and inserts it into the document fragment. Also binds the DOM events
             */
            render: function() {
                this.delegateEvents();
                this.udn = this.sandbox.information.udn;
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.sandbox.on('drawer.open', this.start);
                this.sandbox.on('drawer.close', this.drawerClose);

                this.listenTo(this.model, 'change:binaryState', this.updateAria);
                this.listenTo(this.model, 'change:powerThreshold', this.updateAria);
                this.listenTo(this.model, 'change:stateChangeTS', this.updateAria);
                this.listenTo(this.model, 'change:powerNow', this.updateAria);
                this.listenTo(this.model, 'change:offSince', this.updateAria);
                this.listenTo(this.model, 'change:binaryState', this.checkInterval);
                this.listenTo(this.model, 'change:binaryState', this.updateLabels);
                this.listenTo(this.model, 'change:powerThreshold', this.updateLabels);
                this.listenTo(this.model, 'change:powerNow', this.updateLabels);
                this.listenTo(this.model, 'change:stateChangeTS', this.sinceDate);

                this.sandbox.on('global.onPause', this.onClose);
                this.sandbox.on('global.onResume', this.checkInterval);
            },
            start: function() {
//                this.model.fetch();
                this.parentView.isIntervalSet = true;
                this.checkInterval();
                this.updateLabels();
                this.updateAria();
                this.sinceDate();
                this.drawerOpen();
             },
            drawerClose:function() {
                var self = this;
                var info = {
                    udn: self.udn,
                    isOpen: 0
                };
                smartDevicePlugin.setInsightDrawerState(info);
                this.onClose();
            },
            drawerOpen:function() {
                var self = this;
                var info = {
                    udn: self.udn,
                    isOpen: 1
                };
                smartDevicePlugin.setInsightDrawerState(info);
            },
            /**
             * Logic to update labels according to Binary State variable
             */
            updateLabels: function() {
                var $today = this.$('.on_today'),
                    $avg = this.$('.on_avg_day'),
                    state = parseInt(this.model.get('binaryState'), 10),
                    powerThreshold = parseInt(this.model.get('powerThreshold'), 10) / 1000,
                    powerNow = parseInt(this.model.get('powerNow'), 10) / 1000,
                    onLabel = 'onFor',
                    todayLabel = 'onToday',
                    avgLabel = 'onAvgDay',
                    sinceLabel,
                    attributes;

                if (state === 0) {
                    sinceLabel = 'offSince';
                } else {
                    if (powerNow > powerThreshold) {
                        todayLabel = 'today';
                        avgLabel = 'avgDay';
                        sinceLabel = 'since';
                        onLabel = 'onForNow'
                    } else {
                        sinceLabel = 'standby';
                    }
                }

                attributes = {
                    sinceLabel: sinceLabel,
                    onForLabel: onLabel
                };

                this.model.set(attributes);
                if (todayLabel === 'today') {
                    $today.html(this.i18n('date', 'today'));
                } else {
                    $today.html(this.i18n('labels', todayLabel));
                }
                $avg.html(this.i18n('labels', avgLabel));
            },
            updateAria:function(){
                var friendlyName = this.model.get('friendlyName'),
                    stateDurationLabel = $('.state_duration_text').text(),
                    duration = $('.duration').text(),
                    timeUnit = $('.seconds').text(),
                    offSinceLabel = $('.off_since_text').text(),
                    offSinceTime = this.model.get('offSince'),
                    onTodayDuration = $('.on_today_time').text().replace(/</, "less than "),
                    avgDuration = $('.on_avg_time').text().replace(/</, "less than "),
                    firstContentString = stateDurationLabel + ' ' + duration + timeUnit + ', ' + offSinceLabel + ' ' + offSinceTime + ', todays usage ' + onTodayDuration + ', Average usage ' + avgDuration,

                    estimatedMonthlyCost = this.i18n('currency.' + this.model.get('currency')) + this.estimatedMonthlyCost(),
                    estimatedTodayCost = this.i18n('currency.' + this.model.get('currency')) + this.todayCost(),
                    thirdContentString = "Estimated monthly cost " + estimatedMonthlyCost + ", Today's cost " + estimatedTodayCost,

                    averageWattage = $('.avg_value').text(),
                    nowWattage = $('.now_value').text(),
                    fourthContentString = "Average wattage " + averageWattage + ", Now " + nowWattage;

                $('.firstContent').attr('aria-label', firstContentString);
                $('.thirdContent').attr('aria-label', thirdContentString);
                $('.fourthContent').attr('aria-label', fourthContentString);
            },
            /**
             * Logic to clear/set the fetch interval
             */
            checkInterval: function() {
                var state = parseInt(this.model.get('binaryState'), 10),
                    self = this;

                if (state !== 0 && self.parentView.drawerIsOpen) {
                    if (!this.onTimerInterval) {
                        this.parentView.isIntervalSet = true;
                        this.onTimerInterval = setInterval(function() {
                            self.model.fetch();

                        }, 6000);
                    }
                } else {
                    this.onClose();
                }
            },
            /**
             * Logic to determine the time the insight has been in "On" state
             * @param {Number} val current time in seconds
             */
            timeOnFor: function(val) {
                var time = parseInt(val, 10),
                    auxTimeToShow = '',
                    auxTimeUnit = '',
                    timeToShow,
                    timeUnit;

                if (time < 60) { // Ex: 1 sec
                    timeToShow = time;
                    timeUnit = 0;
                } else if (time < 3600) { //Ex: 1 min
                    timeToShow = time / 60;
                    timeUnit = 1;
                } else if (time < 86400) { //Ex: 1h 1min
                    timeToShow = time / 3600;
                    timeUnit = 2;
                    auxTimeToShow = Math.floor((time % 3600) / 60);
                    auxTimeUnit = this.i18n('timeUnit', 1);
                } else if (time < 864000) { //Ex: 1 day 1h
                    timeToShow = Math.floor(time / 3600 / 24);
                    timeUnit = timeToShow === 1 ? 3 : 4;
                    auxTimeToShow = Math.floor((time % (3600 * 24)) / 3600);
                    auxTimeUnit = this.i18n('timeUnit', 2);
                } else { // Ex:40 days
                    timeToShow = Math.floor(time / 3600 / 24);
                    timeUnit = 4;
                }

                if (auxTimeToShow !== '' && auxTimeToShow === 0) {
                    auxTimeToShow = '';
                    auxTimeUnit = '';
                }

                timeToShow = parseInt(timeToShow, 10);
                this.$('.seconds').html(this.i18n('timeUnit', timeUnit));
                this.$('.durationAux').html(auxTimeToShow);
                this.$('.unitAux').html(auxTimeUnit);

                return timeToShow;
            },
            /**
             * Logic to determine the on and off time of the insight
             */
            sinceDate: function() {
                var stateChangeTS = parseInt(this.model.get('stateChangeTS'), 10),
                    currentTime = new Date(stateChangeTS * 1000),
                    MMDD = new Date(),
                    today = new Date(),
                    yesterday = new Date(),
                    strDate;

                if(stateChangeTS === 0){
                    this.model.set('offSince', '--');
                    return;
                }

                MMDD.setDate(currentTime.getDate());
                MMDD.setHours(0, 0, 0, 0);
                today.setHours(0, 0, 0, 0);
                yesterday.setHours(0, 0, 0, 0);
                yesterday.setDate(yesterday.getDate() - 1);

                if (today.getTime() === MMDD.getTime()) {
                    strDate = this.sandbox.util.customDateFormat(currentTime, '#hh#:#mm# #ampm#');
                } else if (yesterday.getTime() === MMDD.getTime()) {
                    strDate = this.i18n('date','yesterday');
                } else {
                    strDate = this.sandbox.util.customDateFormat(currentTime, '#MMM# #DD#');
                }

                this.model.set('offSince', strDate);
            },
            /**
             * Logic to determine the total time elapsed since "On"
             * @param {Number} val
             * @returns {Number, string}
             */
            formatTimeValue: function(val) {
                var time = parseInt(val, 10);

                if (time > 59) {
                    var hours = Math.floor(time / 3600),
                        minutes = Math.floor((time - (hours * 3600)) / 60);

                    if (hours >= 1) {
                        if (minutes === 0) {
                            return hours + ' <span>' + this.i18n('timeUnit', 2) + '</span>';
                        } else {
                            return hours + ' <span>' + this.i18n('timeUnit', 2) + '</span> ' + minutes + ' <span>' + this.i18n('timeUnit', 1) + '</span>';
                        }
                    } else {
                        return minutes + ' <span>' + this.i18n('timeUnit', 1) + '</span>';
                    }
                } else {
                    return '< 1 <span>' + this.i18n('timeUnit', 1) + '</span>';
                }
            },
            /**
             * Logic to determine the average time elapsed
             * @returns {Number, string}
             */
            estimatedAvgDay: function() {
                var hrsConnected = parseInt(this.model.get('hrsConnected'), 10),
                    past14TotalTime = parseInt(this.model.get('past14TotalTime'), 10),
                    secondsIn2Weeks = 14 * 24 * 3600,
                    avgValue,
                    tttOn = parseInt(this.model.get('tttOn'), 10);

                if (hrsConnected > secondsIn2Weeks) {
                    hrsConnected = secondsIn2Weeks;
                } else {
                    avgValue = hrsConnected < 12 * 3600 ? tttOn : (24 * 3600 * past14TotalTime / hrsConnected);

                    if (avgValue <= 1 || isNaN(avgValue)) {
                        return '< 1 <span>' + this.i18n('timeUnit', 1) + '</span>';
                    } else {
                        return this.formatTimeValue(Math.floor(avgValue));
                    }
                }
            },
            /**
             * Format power value
             * @param {Number} val
             * @returns {Number, string}
             */
            formatPowerValue: function(power) {
                if (power < 2000) {
                    return '< 2';
                } else {
                    return Math.round(power / 1000);
                }
            },
            /**
             * Determine the average power
             * @returns {Number, string}
             */
            averagePower: function() {
                var hrsConnected = parseInt(this.model.get('hrsConnected'), 10),
                    past14TotalTime = parseInt(this.model.get('past14TotalTime'), 10),
                    avg,
                    past14DaysKwh = parseInt(this.model.get('past14DaysKwh'), 10);

                if (hrsConnected < 10 * 3600 || past14TotalTime === 0) {
                    return '- -';
                } else {
                    avg = past14DaysKwh / (1000 * 60) / (past14TotalTime / 3600) * 1000;
                    return this.formatPowerValue(avg) + ' <span>W</span>';
                }
            },
            /**
             * Determine the power currently captured by the insight device
             * @returns {string} power
             */
            powerNow: function() {
                var state = parseInt(this.model.get('binaryState'), 10),
                    past14TotalTime = parseInt(this.model.get('past14TotalTime'), 10),
                    power = parseInt(this.model.get('powerNow'), 10),
                    past14DaysKwh = parseInt(this.model.get('past14DaysKwh'), 10);

                if (state === 0) {
                    return '- -';
                } else {
                    return this.formatPowerValue(power) + ' <span>W</span>';
                }
            },
            /**
             * Logic to show the estimated monthly cost value and today cost value
             * @param cost
             * @returns {number}
             */
            formatCostValue: function(cost) {
                var dollars = Math.floor(cost),
                    cents = 0,
                    res;

                if (cost < 1) { //round to 1 cent
                    cents = Math.floor(cost * 100) % 100;
                } else if (cost < 10) { //round to 5 cents
                    cents = (Math.floor(cost * 20) * 5) % 100;
                } else if (cost < 25) { //round to 25 cents
                    cents = (Math.floor(cost * 4) * 25) % 100;
                }

                res = dollars;

                if (cents > 0) {
                    res += '.' + (cents < 10 ? '0' : '') + cents;
                }

                return res;
            },
            /**
             * Logic to determine the estimated monthly cost
             * @returns {string}
             */
            estimatedMonthlyCost: function() {
                var hrsConnected = parseInt(this.model.get('hrsConnected'), 10),
                    energyPerUnitCost = parseFloat(this.model.get('energyPerUnitCost')),
                    currency = this.model.get('currency'),
                    costPerKwh = parseFloat(energyPerUnitCost) / 1000,
                    powerNow = parseInt(this.model.get('powerNow'), 10),
                    past14DaysKwh = parseInt(this.model.get('past14DaysKwh'), 10),
                    monthlyCost;

                if (hrsConnected < 12 * 3600) {
                    monthlyCost = hrsConnected === 0 ? 0 : (0.001 * powerNow * 730 * costPerKwh);
                } else {
                    monthlyCost = (past14DaysKwh / hrsConnected) * (730 * 3600) * 0.00001667 * costPerKwh;
                }

                monthlyCost /= 1000;

                if (monthlyCost < 0.01 || isNaN(monthlyCost) || isNaN(hrsConnected)) {
                    return '0.00';
                } else {
                    return this.formatCostValue(monthlyCost).toString();
                }
            },
            /**
             * Logic to determine today's cost
             * @returns {string} costDecimals
             */
            todayCost: function() {
                var todayTotalKwh = parseInt(this.model.get('todayTotalKwh'), 10),
                    energyPerUnitCost = parseFloat(this.model.get('energyPerUnitCost')),
                    costPerKwh = parseFloat(energyPerUnitCost) / 1000,
                    currency = this.model.get('currency'),
                    costToday = todayTotalKwh * 0.00001667 * costPerKwh * 0.001;

                if ((costToday >= 0 && costToday < 0.01) || isNaN(costToday)) {
                    return '0.01';
                } else {
                    return this.formatCostValue(costToday).toString();
                }
            },
            /**
             * Logic when drawer is closed
             */
            onClose: function() {
                var self = this;
                if (self.onTimerInterval) {
                    clearInterval(self.onTimerInterval);
                    self.onTimerInterval = false;
                    self.parentView.isIntervalSet = false;
                }
            }
        });

        return View;
    });
define('widgets/wemo_insight/js/drawer',['Cache','widgets/wemo_insight/js/summary'],
/** @exports drawer */
function(Backbone,SummaryView){

    'use strict';

    var View = Backbone.DrawerMasterView.extend({
        /**
         * determines which view to show on initial load
         */
        render: function(){

            var view;
            /** Set the summary view, for now*/
            view = 'summary';
//            if (!this.isIntervalSet) {
                this.changeView(view);
//            }

        },
        loadedViews : {
            summary:{
                view:SummaryView,
                viewType:'drawer'
            }
        }
    });

    return View;
});
/* START_TEMPLATE */
define('hbs!widgets/wemo_insight/templates/edit',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<ul>\n    <li class=\"option threshold_container\" data-value=\"threshold\">\n        <p>\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.on&standbythreshold", options) : helperMissing.call(depth0, "i18n", "editContext.title.on&standbythreshold", options)))
    + "</span>\n            <span class=\"thresholdVal\"><span class=\"value\" data-bind=\"powerThreshold\"></span> W</span>\n        </p>\n        <i class=\"fa fa-angle-right\"></i>\n    </li>\n    <li class=\"option costPerKwh_container\" data-value=\"costPerKwh\">\n        <p>\n            <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.costPerKwh", options) : helperMissing.call(depth0, "i18n", "editContext.title.costPerKwh", options)))
    + "</span>\n            <span class=\"costVal\"><span class=\"currency\" data-bind=\"currency\"></span><span class=\"value\" data-bind=\"energyPerUnitCost\"></span></span>\n        </p>\n        <i class=\"fa fa-angle-right\"></i>\n    </li>\n    <li class=\"option dataExport_container\" data-value=\"dataExport\">\n        <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.dataExport", options) : helperMissing.call(depth0, "i18n", "editContext.title.dataExport", options)))
    + "</span>\n        <i class=\"fa fa-angle-right\"></i>\n    </li>\n</ul>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_insight_templates_edit', t);
return t;
});
/* END_TEMPLATE */
;
/* START_TEMPLATE */
define('hbs!widgets/wemo_insight/templates/costPerkWh',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header class=\"editHeader\">\n    <div class=\"closeIcon\"></div>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.costPerKwh", options) : helperMissing.call(depth0, "i18n", "editContext.title.costPerKwh", options)))
    + "</span>\n</header>\n<section class=\"content\">\n    <div class=\"costPerkWhContent\">\n        <div class=\"currency_container\">\n            <div class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.currency", options) : helperMissing.call(depth0, "i18n", "editContext.title.currency", options)))
    + "</div>\n            <div class=\"value\" data-bind=\"currency\"></div>\n        </div>\n        <div class=\"description_container\">\n            <span class=\"paragraph\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.intros.cost1", options) : helperMissing.call(depth0, "i18n", "editContext.intros.cost1", options)))
    + "</span>\n            <span class=\"paragraph paragraph2\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.intros.cost2", options) : helperMissing.call(depth0, "i18n", "editContext.intros.cost2", options)))
    + "</span>\n        </div>\n        <div class=\"cost_container\">\n            <div class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.costPerKwh", options) : helperMissing.call(depth0, "i18n", "editContext.title.costPerKwh", options)))
    + "</div>\n            <div class=\"value\" data-bind=\"energyPerUnitCost\"></div>\n        </div>\n        <div class=\"resetBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.reset", options) : helperMissing.call(depth0, "i18n", "buttons.reset", options)))
    + "</div>\n    </div>\n</section>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_insight_templates_costPerkWh', t);
return t;
});
/* END_TEMPLATE */
;
//this is the base edit screen. load any additional edit view screens here. make sure to pass the newly created model to the views when instantiating them.
define('widgets/wemo_insight/js/editcostperkwh',['Cache', 'hbs!widgets/wemo_insight/templates/costPerkWh'],
    /** @exports summary view */
    function(Backbone, template) {
        'use strict';

        var popup;

        /**
         * view for currency popup
         */
        var PopupView = Backbone.View.extend({
            initialize: function() {
                this.$el.append(popup);
            },
            events: {
                'click .selectOption': 'setActiveCurrency'
            },
            /**
             * active the currency selected by the user
             * @param event
             */
            setActiveCurrency: function(event) {
                this.$('.selectOption').removeClass('active');
                this.$(event.currentTarget).addClass('active');
            }
        });

        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            className: 'costPerKwhPage noMainHeader',
            template: template,

            events: {
                'click .editHeader': 'close',
                'click .currency_container': 'showCurrencyPopup',
                'click .cost_container': 'showCostPopup',
                'click .resetBtn': 'resetCost'
            },
            /**
             * two-way data binding
             */
            bindings: {
                '*[data-bind="energyPerUnitCost"]': {
                    observe: 'energyPerUnitCost',
                    onGet: function(value) {
                        return parseFloat(value) / 1000;
                    }
                },
                '*[data-bind="currency"]': {
                    observe: 'currency',
                    updateMethod: 'html',
                    onGet: function(value) {
                        return this.i18n('currency.' + value) + ' ' + this.i18n('editContext.currencyName.' + value);
                    }
                }
            },
            /**
             * after the template has rendered, add default value to attributes
             */
            listen: function() {
                this.listenTo(this.model, 'change:currency', this.saveDefaultHomeSettings);
            },
            /**
             * create currency popup UI
             */
            setCurrencyPopupUI: function() {
                var divs = '<div class="currencyContainer">',
                    activeCurrency,
                    currencies = ['1', '3', '4', '7', '10', '13', '15'];

                for (var i = 0; i < 7; i++) {
                    this.model.get('currency') === currencies[i] ? activeCurrency = " active" : activeCurrency = "";
                    divs += '<div class="selectOption currency-' + currencies[i] + activeCurrency + '"><p>' + this.i18n('editContext.currencyName.' + currencies[i]) + '</p></div>';
                }
                divs += '</div>';
                popup = divs;
                this.popup = new PopupView();
            },
            /**
             * show currency confirm dialog popup, and set currency to currency attribute
             */
            showCurrencyPopup: function() {
                this.setCurrencyPopupUI();

                var self = this,
                    popupTemplate = new PopupView();
                this.confirmDialog = new this.sandbox.dom.CustomModal({
                    title: this.i18n('editContext.title.currency'),
                    popupClass: 'currencyInsightPopup',
                    view: popupTemplate,
                    buttons: [{
                        text: this.i18n('editContext.buttons', 'cancel'),
                        extraClass: 'passiveBtn',
                        width: '50%'
                    }, {
                        text: this.i18n('editContext.buttons', 'set'),
                        extraClass: 'actionBtn',
                        width: '50%',
                        events: [{
                            tap: function() {
                                var className = $(popupTemplate.$el).find('.active').attr('class'),
                                    number;

                                className = className.split(' ');
                                number = className[1].split('-')[1];
                                if (self.model.get('currency') !== number) {
                                    self.model.set('currency', number);
                                    self.sandbox.model.set('currency', number);
                                    self.saveAction();
                                }
                            }
                        }]
                    }]
                });
                $('.currencyInsightPopup .notification_inner').addClass('selectPopup');
            },
            /**
             * reset energyPerUnitCost data to defaults
             */
            saveDefaultHomeSettings: function() {
                var energyPerUnitCost = parseInt(this.model.get('energyPerUnitCost'),10),
                    currency = this.model.get('currency'),
                    defaultEnergyPerUnitCost = '';

                this.model.set('defaultEnergyPerUnitCost', this.model.defaultCost[currency]);
                defaultEnergyPerUnitCost = this.model.get('defaultEnergyPerUnitCost');
                if (energyPerUnitCost !== defaultEnergyPerUnitCost) {
                    this.model.set({
                        energyPerUnitCost: defaultEnergyPerUnitCost,
                        currency: currency
                    });
                    this.saveAction();
                }
            },
            /**
             * add new value to eneryPerUnitCost attribute
             * @param newValue
             */
            setEnergyPerUnitCost: function(newValue) {
                if (this.model.get('energyPerUnitCost') !== newValue) {
                    this.model.set('energyPerUnitCost', newValue);
                    this.saveAction();
                }
            },
            /**
             * show cost scroll popup, and set new cost to energyPerUnitCost attribute
             */
            showCostPopup: function() {
                var self = this;
                this.$('.cost_container').mobiscroll().scroller({
                    theme: 'wemoModal mobiCost',
                    mode: 'scroller',
                    display: 'bottom',
                    buttons: [
                        'cancel',
                        'set'
                    ],
                    headerText: 'Cost per kWh',
                    wheels: [[
                        {
                            keys: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                            values: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                        },
                        {
                            keys: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                            values: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                        },
                        {
                            keys: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                            values: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                        },
                        {
                            keys: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
                            values: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                        }
                    ]],
                    onBeforeShow: function(inst) {
                        var costPerKwh = parseFloat(self.model.get('energyPerUnitCost')) / 1000,
                            value = costPerKwh.toString().replace('.', ''),
                            v1 = value[0],
                            v2 = value[1],
                            v3 = value[2],
                            v4 = value[3];

                        $(this).mobiscroll('setValue', [v1, v2, v3, v4]);
                    },
                    onShow: function(){
                        var costPerKwh = (parseFloat(self.model.get('energyPerUnitCost')) / 1000).toString(),
                            position = costPerKwh.indexOf('.');

                         if (position === 2) {
                            $(".mobiCost.wemoModal .dwwl2 > .dwwol").addClass("show");
                            this.times = 10;
                        } else if (position === -1 && costPerKwh.length === 3) {
                            $(".mobiCost.wemoModal .dwwl3 > .dwwol").addClass("show");
                            this.times = 100;
                        } else if (position === -1 && costPerKwh.length === 4) {
                            this.times = 1000;
                        } else {
                             $(".mobiCost.wemoModal .dwwl1 > .dwwol").addClass("show");
                             this.times = 1;
                         }
                    },
                    onClose: function(value, btn) {
                        if (btn === 'set') {
                            var price = value.replace(/ /g, ''),
                                newValue;

                            if (price[0] === '0') {
                                price = price.slice(1, price.length);
                            }
                            newValue = parseInt(price) * this.times;
                            self.setEnergyPerUnitCost(newValue);
                        }
                    }
                });
            },
            /**
             * show reset cost confirm dialog popup, and set default cost to energyPerUnitCost attribute according to currency
             */
            resetCost: function() {
                var self = this;
                this.confirmDialog = new this.sandbox.dom.CustomModal({
                    title: this.i18n('editContext.alertMessage', 'resetDefault'),
                    popupClass: 'commonPopup',
                    message: this.i18n('editContext.alertMessage', 'messageResetCost'),
                    buttons: [{
                        text: this.i18n('editContext.buttons', 'cancel'),
                        extraClass: 'passiveBtn',
                        width: '50%'
                    }, {
                        text: this.i18n('editContext.buttons', 'reset'),
                        extraClass: 'actionBtn',
                        width: '50%',
                        events: [{
                            tap: function() {
                                self.saveDefaultHomeSettings();
                            }
                        }]
                    }]
                });
            },
            /**
             * send attributes changed to native code
             * @param variable
             */
            saveAction: function() {
                var self = this;

                clearTimeout(this.saveTime);
                this.saveTime = setTimeout(function() {
                    self.model.save(['energyPerUnitCost', 'currency']).done(self.successSaveAction).fail(self.failSaveAction);
                    clearTimeout(self.saveTime);
                }, 500);
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log('Save currency and energyPerUnitCost successfully. Response: ' + resp);
            },
            /**
             * When saveAction fails
             */
            failSaveAction: function(resp) {
                DEBUG && console.log('Failed on save currency and energyPerUnitCost. Response: ' + resp);
            },
            afterSave: function() {

            }
        });

        return View;
    });
/* START_TEMPLATE */
define('hbs!widgets/wemo_insight/templates/dataExport',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, stack2, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header class=\"editHeader\">\n    <div class=\"closeIcon\"></div>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.dataExport", options) : helperMissing.call(depth0, "i18n", "editContext.title.dataExport", options)))
    + "</span>\n</header>\n<section class=\"content\">\n    <div class=\"dataExportContent\">\n        <span class=\"intro\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.intros.dataExport", options) : helperMissing.call(depth0, "i18n", "editContext.intros.dataExport", options)))
    + "</span>\n        <ul class=\"exportInfo\">\n            <li class=\"email_container\">\n                <input type=\"text\" id=\"editEmail\" data-bind=\"emailAddress\" placeholder=\"";
  options = {hash:{}};
  stack2 = ((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.enterEmail", options) : helperMissing.call(depth0, "i18n", "editContext.title.enterEmail", options));
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\">\n            </li>\n            <li class=\"schedule_container\">\n                <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.scheduleExpo", options) : helperMissing.call(depth0, "i18n", "editContext.title.scheduleExpo", options)))
    + "</span>\n                <div class=\"btnTurnOffOn\">\n                    <span class=\"btnTurn\">\n                        <span class=\"btnSlider\"></span>\n                    </span>\n                </div>\n            </li>\n        </ul>\n        <div id=\"interval\">\n            <div class=\"emailInterval_container\">\n                <div class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.interval", options) : helperMissing.call(depth0, "i18n", "editContext.title.interval", options)))
    + "</div>\n                <div class=\"value\" data-bind=\"dataExportType\"></div>\n            </div>\n            <div class=\"infoInterval_container\">\n                <p class=\"timeSpec\"></p>\n            </div>\n        </div>\n        <div class=\"sendBtn\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.buttons.exportNow", options) : helperMissing.call(depth0, "i18n", "editContext.buttons.exportNow", options)))
    + "</div>\n        <h1 class=\"exportSent\"><span class=\"fa fa-check\">&nbsp;";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.intervalInfo.exportSent", options) : helperMissing.call(depth0, "i18n", "editContext.intervalInfo.exportSent", options)))
    + "</h1>\n    </div>\n</section>\n";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_insight_templates_dataExport', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_insight/js/editdataexport',['backbone', 'hbs!widgets/wemo_insight/templates/dataExport'],
    function(Backbone, template) {
        'use strict';

        var popup;

        var PopupView = Backbone.View.extend({
            initialize: function() {
                this.$el.append(popup);
            },
            events: {
                'click .selectOption': 'setActiveInterval'
            },
            /**
             * active the currency selected by the user
             * @param event
             */
            setActiveInterval: function(event) {
                this.$('.selectOption').removeClass('active');
                this.$(event.currentTarget).addClass('active');
            }
        });

        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            className: "dataExportPage noMainHeader",
            template: template,
            sendEmailAvailable: false,

            events: {
                'click .editHeader': 'close',
                'click .btnTurn': 'changeScheduleExport',
                'click .emailInterval_container': 'showIntervalPopup',
                'click .sendBtn': 'doExport',
                'keyup #editEmail': 'isThereEmail'
            },
            /**
             * two-way data binding
             */
            bindings: {
                '*[data-bind="dataExportType"]': {
                    observe: 'dataExportType',
                    update: function(view,value) {
                        var dataExportType = parseInt(value, 10);
                        if (dataExportType < 4 && dataExportType > 0) {
                            this.calculateNextExport(value);
                            var str = this.i18n('editContext.intervals.' + value);
                            this.$(".emailInterval_container .value").text(str);
                        }
                    }
                },
                '*[data-bind="emailAddress"]': {
                    observe: 'emailAddress',
                    onGet: function(value) {
                        return value;
                    }
                }
            },

            listen: function() {
                this.listenTo(this.model, 'change:emailAddress', this.isThereEmail);
            },

            /**
             * after the template has rendered, add default value to attributes
             */
            afterRender: function() {
                this.isThereEmail(this.model.get('emailAddress'));
                this.checkRemote();
                this.checkIntervalToggle();
            },

            checkRemote:function(){
                var remote = window.sessionStorage.getItem("isRemoteEnabled"),
                    self = this;
                if(remote === "false"){
                    this.confirmDialog = new this.sandbox.dom.CustomModal({
                        title: "Remote Access Required",
                        message: "Exporting data requires remote access. To enable this, go to More.",
                        buttons: [{
                            text: this.i18n('editContext.buttons', 'ok'),
                            extraClass: 'actionBtn',
                            width: '100%',
                            events: [
                                {
                                    tap: function() {
                                        self.close();
                                    }
                                }
                            ]
                        }]
                    });
                }
            },
            /**
             * create email interval popup UI
             */
            setIntervalPopupUI: function() {
                var divs = '<div class="intervalContainer">',
                    activeInterval;

                for (var i = 1; i < 4; i++) {
                    this.model.get('dataExportType') === i.toString() ? activeInterval = " active" : activeInterval = "";
                    divs += '<div class="selectOption interval-' + i + activeInterval + '"><p>' + this.i18n('editContext.intervals.' + i) + '</p></div>';
                }
                divs += '</div>';
                popup = divs;

                this.popup = new PopupView();
            },

            checkIntervalToggle: function() {
                var dataExportType = parseInt(this.model.get('dataExportType'), 10),
                    emailAddress = this.model.get('emailAddress');
                if (emailAddress !== "" && (dataExportType < 4 && dataExportType > 0)) {
                    this.$('.btnTurn').addClass('toggleOn');
                    this.$('#interval').show();
                }
            },
            /**
             * change toggle state UI and show or hide .emailInterval_container
             */
            changeScheduleExport: function() {
                if (this.$('.btnTurn').hasClass('toggleOn')) {
                    this.$('.btnTurn').removeClass('toggleOn');
                    this.$('#interval').hide();
                    this.model.set('dataExportType', '4');
                } else {
                    this.$('.btnTurn').addClass('toggleOn');
                    this.$('#interval').show();
                    var dataExportType = parseInt(this.model.get('dataExportType'), 10);
                    if ( dataExportType > 3 || dataExportType < 1) {
                        this.model.set('dataExportType', '3');
                    }
                }
            },
            /**
             * show email interval scroll popup, and set new interval to emailInterval attribute
             */
            showIntervalPopup: function() {
                this.setIntervalPopupUI();

                var popupTemplate = new PopupView(),
                    self = this;
                this.confirmDialog = new this.sandbox.dom.CustomModal({
                    title: this.i18n('editContext.alertMessage.exportInterval'),
                    popupClass: 'intervalInsightPopup',
                    view: popupTemplate,
                    buttons: [{
                        text: this.i18n('editContext.buttons', 'cancel'),
                        extraClass: 'passiveBtn',
                        width: '50%'
                    }, {
                        text: this.i18n('editContext.buttons', 'set'),
                        extraClass: 'actionBtn',
                        width: '50%',
                        events: [{
                            tap: function() {
                                var className = $(popupTemplate.$el).find('.active').attr('class'),
                                    newValue;

                                className = className.split(' ');
                                newValue = className[1].split('-')[1];
                                if (self.model.get('dataExportType') !== newValue) {
                                    self.model.set('dataExportType', newValue);
                                    self.saveAction();
                                }
                            }
                        }]
                    }]
                });
                $('.intervalInsightPopup .notification_inner').addClass('selectPopup');
            },
            isThereEmail: function(value) {
                var newEmail,
                    filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if(typeof value === 'string'){
                    newEmail = value.replace(/ /g,'');
                } else {
                    newEmail = this.$('#editEmail').val().replace(/ /g,'');
                }
                
                if (newEmail === '' || !filter.test(newEmail)) {
                    this.sendEmailAvailable = false;
                    this.$('.sendBtn').removeClass('exportBtn');
                } else {
                    this.sendEmailAvailable = true;
                    this.$('.sendBtn').addClass('exportBtn');
                    this.model.set('emailAddress',newEmail);
                }
            },
            /**
             * show export confirm dialog popup
             */
            doExport: function() {
                if (this.sendEmailAvailable) {
                    var self = this;

                    this.confirmDialog = new this.sandbox.dom.CustomModal({
                        title: this.i18n('editContext.buttons', 'exportNow'),
                        message: this.i18n('editContext.alertMessage', 'messageExport') + ' ' + self.model.get('emailAddress'),
                        buttons: [{
                            text: this.i18n('editContext.buttons', 'cancel'),
                            extraClass: 'passiveBtn',
                            width: '50%'
                        }, {
                            text: this.i18n('editContext.buttons', 'send'),
                            extraClass: 'actionBtn',
                            width: '50%',
                            events: [
                                {
                                    tap: function() {
                                        self.exportNow();
                                    }
                                }
                            ]
                        }]
                    });
                } else {
                    this.confirmDialog = new this.sandbox.dom.CustomModal({
                        title: "Please check your entry",
                        message: "You must enter a valid email address",
                        buttons: [{
                            text: this.i18n('editContext.buttons', 'ok'),
                            extraClass: 'passiveBtn',
                            width: '100%'
                        }]
                    });
                }
            },

            /**
             * send attributes changed to native code
             * @param variable
             */
            exportNow: function() {
                this.model.set('dataExportType', 0);
                this.saveAction();
                $('.exportSent').show();
            },
            /**
             * send attributes changed to native code
             * @param variable
             */
            saveAction: function() {
                var self = this;

                clearTimeout(this.saveTime);
                this.saveTime = setTimeout(function() {
                    self.model.save(['emailAddress', 'dataExportType']).done(self.successSaveAction).fail(self.failSaveAction);
                    clearTimeout(self.saveTime);
                }, 500);
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log(resp);
            },
            /**
             * When saveAction fails
             */
            failSaveAction: function(resp) {
                DEBUG && console.log(resp);
            },
            setEmailAddress: function() {
                this.model.set('emailAddress', this.$('#editEmail').val());
            },
            calculateNextExport: function(exportType) {
                var time = '',
                    date = new Date(),
                    timeLeft = 1,
                    timeSpec = this.i18n('editContext.intervalInfo', 'info');

                if (exportType === '2') {
                    var day = date.getDay();

                    if (day === 0) {
                        timeLeft = 7;
                    } else {
                        if ((7 - day) > 1) {
                            timeLeft = 7 - day;
                        }
                    }
                } else if (exportType === '3') {
                    var year = date.getFullYear(),
                        month = date.getMonth(),
                        day = date.getDate(),
                        lastDay = new Date(year, month + 1, 0).getDate();

                    if (day === lastDay) {
                        var nextMonth = new Date(year, month + 1 , 1).getMonth();

                        timeLeft = new Date(year, nextMonth + 1, 0).getDate();
                    } else {
                        if ((lastDay - day) > 1) {
                            timeLeft = lastDay - day;
                        }
                    }
                }

                if (timeLeft === 1) {
                    time = this.i18n('timeUnit', '3');
                } else {
                    time = this.i18n('timeUnit', '4');
                }

                if (timeSpec.indexOf('__time__') !== -1) {
                    this.$('.timeSpec').text(timeSpec.replace('__time__', timeLeft + time));
                } else {
                    this.$('.timeSpec').text(timeSpec + timeLeft + ' ' + time + '.');
                }
            }
        });

        return View;
    });
/* START_TEMPLATE */
define('hbs!widgets/wemo_insight/templates/threshold',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression;


  buffer += "<header class=\"editHeader\">\n    <div class=\"closeIcon\"></div>\n    <span class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.threshold", options) : helperMissing.call(depth0, "i18n", "editContext.title.threshold", options)))
    + "</span>\n</header>\n<section class=\"content\">\n    <div class=\"thresholdContent\">\n        <div class=\"power_container\">\n            <div class=\"title\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.title.powerThreshold", options) : helperMissing.call(depth0, "i18n", "editContext.title.powerThreshold", options)))
    + "</div>\n            <div class=\"value\"><span data-bind=\"powerThreshold\"></span> W</div>\n        </div>\n        <div class=\"description_container\">\n            <span class=\"paragraph\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.intros.threshold1", options) : helperMissing.call(depth0, "i18n", "editContext.intros.threshold1", options)))
    + "</span>\n            <span class=\"paragraph paragraph2\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.intros.threshold2", options) : helperMissing.call(depth0, "i18n", "editContext.intros.threshold2", options)))
    + " <span class=\"powerNow\" data-bind=\"powerNow\"></span></span>\n            <span class=\"paragraph paragraph3\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.intros.threshold3", options) : helperMissing.call(depth0, "i18n", "editContext.intros.threshold3", options)))
    + " <span data-bind=\"powerIndicator\" ></span></span>\n        </div>\n        <div class=\"autoResetBtn\" data-value=\"autoReset\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "editContext.buttons.autoReset", options) : helperMissing.call(depth0, "i18n", "editContext.buttons.autoReset", options)))
    + "</div>\n        <div class=\"resetBtn\" data-value=\"reset\">";
  options = {hash:{}};
  buffer += escapeExpression(((stack1 = helpers.i18n),stack1 ? stack1.call(depth0, "buttons.reset", options) : helperMissing.call(depth0, "i18n", "buttons.reset", options)))
    + "</div>\n    </div>\n</section>";
  return buffer;
  });
Handlebars.registerPartial('widgets_wemo_insight_templates_threshold', t);
return t;
});
/* END_TEMPLATE */
;
//this is the base edit screen. load any additional edit view screens here. make sure to pass the newly created model to the views when instantiating them.
define('widgets/wemo_insight/js/editthreshold',['Cache', 'hbs!widgets/wemo_insight/templates/threshold', 'libs/smartDevicePlugin'],
    /** @exports summary view */
    function(Backbone, template, smartDevicePlugin) {
        'use strict';

        var View = Backbone.OverlayView.extend({
            tagName: 'div',
            className: "thresholdPage noMainHeader",
            template: template,
            AUTO_RESET_ACTION: 'resetAutoThreshold',
            RESET_ACTION: 'resetThreshold',

            events: {
                'click .editHeader': 'close',
                'click .power_container': 'showPowerPopup',
                'click .autoResetBtn': 'showResetPopup',
                'click .resetBtn': 'showResetPopup'
            },
            /**
             * two-way data binding
             */
            bindings: {
                '*[data-bind="powerThreshold"]': {
                    observe: 'powerThreshold',
                    onGet: function(value) {
                        var powerThreshold = parseInt(value, 10);
                        return powerThreshold / 1000;
                    }
                },
                '*[data-bind="powerNow"]': {
                    observe: 'powerNow',
                    onGet: function(value) {
                        return this.formatPowerValue(value);
                    }
                }
            },
            /**
             * after the template has rendered, add default value to attributes
             */
            afterRender: function() {

            },

            /**
             *
             * @param action
             */
            resetPowerThreshold: function(action) {
                smartDevicePlugin.resetDevice(action, this.model.getInformation(), null).then(this.successResetAction).fail(this.failSaveAction);
            },
            /**
             * add new value to powerThreshold attribute
             * @param newValue
             */
            setPowerThreshold: function(newValue) {
                if (this.model.get('powerThreshold') !== newValue) {
                    this.model.set('powerThreshold', newValue);
                    this.saveAction('powerThreshold');
                }
            },
            /**
             * show power threshold scroll popup, and set new value to powerThreshold attribute
             */
            showPowerPopup: function() {
                var self = this;
                this.$('.power_container').mobiscroll().timespan({
                    wheelOrder: 's',
                    theme: 'wemoModal mobiWatts',
                    steps: 1,
                    display: 'bottom',
                    rows: 3,
                    minTime: 2000,
                    maxTime: 99000,
                    labels: ['Y', 'M', 'D', '', '', ''],
                    mode: 'scroller',
                    buttons: ['set', 'cancel'],
                    headerText: 'Threshold',
                    onBeforeShow: function() {
                        self.$('.power_container').mobiscroll('setValue', self.model.get('powerThreshold') / 1000);
                    },
                    onShow: function() {

                    },
                    onClose: function(value, btn) {
                        if (btn === 'set') {
                            var selectedVal = value.split(' '),
                                newValue = parseInt(selectedVal[0]) * 1000;

                            self.setPowerThreshold(newValue);
                        }
                    }
                });
            },
            /**
             * show reset confirm dialog popup, and set powerThreshold attribute to default automatically
             */
            showResetPopup: function(e) {
                var option = this.$(e.currentTarget).attr('data-value'),
                    self = this,
                    title = '',
                    message = '',
                    action = '';

                if (option === 'autoReset') {
                    title = this.i18n('editContext.alertMessage', 'autoSet');
                    message = this.i18n('editContext.alertMessage', 'autoReset-desc');
                    action = this.AUTO_RESET_ACTION;
                } else {
                    title = this.i18n('editContext.title.confirm');
                    message = this.i18n('editContext.alertMessage', 'reset-desc');
                    action = this.RESET_ACTION;
                }

                this.confirmDialog = new this.sandbox.dom.CustomModal({
                    title: title,
                    popupClass: 'commonPopup',
                    message: message,
                    buttons: [{
                        text: this.i18n('buttons.cancel'),
                        extraClass: 'passiveBtn',
                        width: '50%'
                    }, {
                        text: this.i18n('buttons.reset'),
                        extraClass: 'actionBtn',
                        width: '50%',
                        events: [{
                            tap: function() {
                                self.resetPowerThreshold(action);
                            }
                        }]
                    }]
                });
            },
            /**
             * set the powerNow variable to appropriate value
             * @param power
             */
            formatPowerValue: function(power) {
                var power = power >= 2000 ? Math.round(power / 1000) : '< 2';

                this.setIndicatorUI();
                return power + ' W';
            },
            /**
             * set indicator UI according to powerNow
             * @param power
             */
            setIndicatorUI: function() {
                var powerThreshold = parseInt(this.model.get('powerThreshold'), 10) / 1000,
                    powerNow = parseInt(this.model.get('powerNow'), 10) / 1000,
                    mode = parseInt(this.model.get('binaryState'), 10),
                    $indicator = this.$('*[data-bind="powerIndicator"]');

                if (mode !== 0) {
                    if (powerNow > powerThreshold) {
                        $indicator.removeClass().addClass('on');
                        this.model.set('binaryState', 1);
                    } else {
                        $indicator.removeClass().addClass('standby');
                        this.model.set('binaryState', 8);
                    }
                } else {
                    $indicator.removeClass().addClass('off');
                    this.model.set('binaryState', 0);
                }
                this.saveAction('binaryState');
            },
            /**
             * send attributes changed to native code
             * @param variable
             */
            saveAction: function(variable) {
                var self = this;
//                this.sandbox.uiInterface.showSpinner();
                clearTimeout(this.saveTime);
                this.saveTime = setTimeout(function() {
                    self.model.save([variable]).done(self.successSaveAction).fail(self.failSaveAction);
                    clearTimeout(self.saveTime);
                }, 500);
            },
            /**
             * When saveAction is success
             */
            successSaveAction: function(resp) {
                DEBUG && console.log("successSaveAction: " + resp);
                this.setIndicatorUI();
//                this.sandbox.uiInterface.hideSpinner();
            },
            /**
             * When resetDevice is success
             */
            successResetAction: function(resp) {
                DEBUG && console.log("successResetAction: " + resp);
                this.setPowerThreshold(resp);
                this.setIndicatorUI();
//                this.sandbox.uiInterface.hideSpinner();

            },
            /**
             * When saveAction or resetDevice fails
             */
            failSaveAction: function(resp) {
                DEBUG && console.log("failSaveAction: " + resp);
//                this.sandbox.uiInterface.hideSpinner();
            }

        });

        return View;
    });
//this is the base edit screen. load any additional edit view screens here. make sure to pass the newly created model to the views when instantiating them.
define('widgets/wemo_insight/js/edit',['Cache', 'hbs!widgets/wemo_insight/templates/edit','widgets/wemo_insight/js/model','widgets/wemo_insight/js/editcostperkwh','widgets/wemo_insight/js/editdataexport','widgets/wemo_insight/js/editthreshold'],
    /** @exports summary view */
    function(Backbone, template, Model, EditCostPerKwh, DataExport, Threshold) {
        'use strict';

        var viewList = {
            'costPerKwh': EditCostPerKwh,
            'dataExport': DataExport,
            'threshold': Threshold
        };

        var View = Backbone.View.extend({
            template: template,

            initialize: function(options) {
                options = options || {};
                _.extend(this, options);
                if (!this.sandbox) {
                    throw ('you must pass the sandbox to this view.')
                } else {
                    this.model = this.sandbox.model;
                    DEBUG && console.log("Insight Edit Device Model: " + JSON.stringify(this.sandbox.model));
                }
            },
            events: {
                'click .option': 'navigate'
            },
            /**
             * two-way data binding
             */
            bindings: {
                '*[data-bind="powerThreshold"]': {
                    observe: 'powerThreshold',
                    onGet: function(value) {
                        var powerThreshold = parseInt(value, 10);
                        return powerThreshold / 1000;
                    }
                },
                '*[data-bind="currency"]': {
                    observe: 'currency',
                    updateMethod: 'html',
                    onGet: function(value) {
                        var arr = [1, 3, 4, 7, 10, 13, 15],
                            currency;

                        if (arr.indexOf(parseInt(value, 10)) === -1) {
                            value = 1;
                            this.model.set('currency', value);
                        }

                        return this.i18n('currency.' + value);
                    }
                },
                '*[data-bind="energyPerUnitCost"]': {
                    observe: 'energyPerUnitCost',
                    onGet: function(value) {
                        return parseFloat(value) / 1000;
                    }
                }
            },
            /**
             * localizes the template, and inserts it into the document fragment. Also binds the DOM events
             */
            render: function() {
                var html = this.i18n(this.template);
                this.$el.html(html);
                this.stickit();
                this.delegateEvents();
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {

            },
            /**
             * navigates to a new edit screen
             */
            navigate: function(e) {
                if (!this.sandbox.lastFocusInput) {
                    var $el = $(e.currentTarget);
                    var path = $el.data('value');
                    if (!this.childViews) {
                        this.childViews = {};
                    }
                    this.childViews[path] = new viewList[path]({
                        model: this.model,
                        sandbox: this.sandbox,
                        parentElement: this.parent.$el
                    });

                    this.childViews[path].initialRender();
                    this.childViews[path].$el.removeClass('settings');
                }
            }
        });

        return View;
    });
define('widgets/wemo_insight/main', ['text!widgets/wemo_insight/css/main.css','widgets/wemo_insight/js/model','widgets/wemo_insight/js/tile','widgets/wemo_insight/js/drawer','widgets/wemo_insight/js/summary','widgets/wemo_insight/js/edit'],

    function(css, data, TileView, DrawerView, SummaryView, EditView) {

        'use strict';

        return {
            type: 'TileAndDrawer',
            styles: css,
            Tile: TileView,
            Drawer: DrawerView,
            Summary: SummaryView,
            Model: data.Model,
            config: {
                edit: {
                    View: EditView
                }
            }
        };
    });}());