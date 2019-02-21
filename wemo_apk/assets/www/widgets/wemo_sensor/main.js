(function () {
define('text!widgets/wemo_sensor/css/main.css',[],function () { return '\n.wemo_sensor .smart-tile .icon, .wemo_sensor .defaultIcon {\n    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADwCAMAAAAJixmgAAAABGdBTUEAALGPC/xhBQAAAvdQTFRFampqGxsbUFBQ5ubm6OjoOzs76urqra2tVlZWU1NT5eXlysrK4+Pj7Ozsnp6elpaWnJycwMDA29vb2dnZlJSUkpKSycnJoqKitra209PThoaG1tbW39/fvLy8YGBgt7e3ra2ttbW1q6ureXl5AAAAAAAAuLi4paWlNTU1QkJCfX19goKCxcXFPDw8m5ubAAAAycnJ4ODgWlpar6+vpaWlRkZGW1tbEhISfn5+l5eXp6ens7OzjIyMAAAAAAAAAAAAkZGRJSUlra2tZGRkgYGBw8PDZmZmzs7OampqUlJS0tLSAAAAAAAAAAAAAAAAc3NzjY2NsLCwAwMDi4uLAAAAAAAAAAAAY2NjAAAAAAAAGxsbAAAAXV1dX19fAAAAAAAAAAAAAAAAAAAAWFhYAAAAAAAAdXV1AAAAAAAAAAAAAAAAAAAAAAAAAwMDBAQEAAAAYWFhAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAg9r13d7eVuP8bd/5WPT/rtjtUez/jtnzxdnm3N/j3+DhYOD6pdjvl9nyeHh4iIiI4OHiv9no093jt9fp2N3h293fy9ni3t/h29zcjo6Oz9ri4eLik5OTenp6c3NzfHx8dnZ219rexMTExcXFmJiYdXV1i4uLhISE2tvdpKSkgoKCn5+fdHR0gICAnZ2dwMDAoqKig4ODysrKwsLCqampzMzMt7e3tra2zs7OuLi4p6ens7OzycnJyMjIzc3N/Pz8urq6q6ury8vLra2t/f39ubm5r6+v+/v7sbGxu7u7v7+/09PTvr6+vb29vLy8xsbGz8/PtLS0/v7+1NTU+vr61dXV1tbW0NDQ6enp19fX6+vr6Ojo6urq4eHh2NjY7Ozs7+/v7e3t8fHx+fn50tLS4uLi8PDw8vLy0dHR7u7u2dnZ5+fn4+Pj+Pj48/Pz5ubm5eXl9PT05OTk9fX12tra9vb29/f34ODg////3d3d29vb3Nzc3t7e39/fxdXzdwAAAH90Uk5T44mF+vms+tvgvvnv8vzT0rjf5O2XsO3G9vWQ+OnrhNvF0OuLyLq/tlpcprTqZd2f0+9ltKhmb0aXqOb2nJlpYo5R8PmCy3fpjXjupXhxWX7G7kOWxn/C+UerS4b5+ZA1rydM+Co5mFCMIy4fBUA8MvmyGwkRFwwPyRQCBwMBAMOc7z4AACAASURBVHja7Z13XNznmeB9t1e2bzY9G6du4po47vbacYm7nbgp57Njx1bkSLIBIRxAsDTf7mZTnMS9W26SXJBshCgSQvQiJFEGiTZMYQrMDNP7/Jj2xz3lfWeQd+/2Tr9xmOzOKxCjYeCjL8/zPv19Oe3x/2DrtAJwAbgAXAAuABeAC8AF4AJwAbgAXAAuABeAC8AF4AJwAbgAXAAuABeAC8AF4AJwAbgAXAAuABeAC8AF4AJwAbgAXAD+DwDc0FALq+HfO3BtfV1FVXVlTXnJho3FsDYWlZTXVFZXV9TV1zf8+wJuqK+rqikp3nT/hTdce+2nL77ojBtvPP/8G28846KLP33ttTdcenbp+o3llVV1vxfsjx24YUtFTdGms2649szzT7/gj3wnVj66Yvo/P/2TN1587Z33ry+qrPjYoT9e4Nq66qKtF157xicvsPeOjAwNjcR8Tq0+YEzHYaWNIb3BYvWODJ04AT8H8wWfvOjaCzcVVdc1/IECN9RVb7j/hjM++acjizGvN2zXp6cmO3p6OuZGZ2bnF1yuhfnZ0aXlubmlqUTAFF7sHRoZWvkvp190w/0bPk7mjw24vqqk9IYzLgh6g8Fw0Gkb7Wlpn4rEFVsoFOA/tPyBQMiYTs4sL48mtT4vrBOxC8644bKSqvo/LOAt1cUXXvwps9dhDwYNkfbujnlg9dhsNk8oxKx+WvQQnwilI8uTo0Y7qIK3N3z6RTeVVW75wwHeUll2541/6nU4zVFrvKV7KZI2KkajzSNo/UDrhuWHP2546CdBw0rNdCzZgjFfMHbiL86/YVNN3R8GcH3l+jvP10btFnPUOaqZdKVSimJE4XoYFxehwpveT8ws65An5IkvdaR8MZ8vPBK8+YZNH4OUcw5cX1180/mmoNNijlmndiwlkvE08iIxAKH+ErCQL72vRvbYjDPtSdz5wcXo+TcVV9fmOXD9tgtvDAGuMxye0cxFkvFUGvXZJiSMMhbAmYX/CLjlfgZmZaYnGY4Gw+Fey40XbqvPa+CKDXd+Kmy2OK3TutZ2VyQRJ30WGr1Kp1fJ18/yFcAkZFt6uccaA+LY0AU3FdXlMXBF2cV+h9Np9vXG9065IslkCgQM9gqAjQDyr0nYz1Yra7JBxjbFGGnxe8Owpv/i4rKKvAWuKDvTZzc7rcHe2b3zyAsRFRCDUhuNnlUiDvilMpPtQiuNtP4QOyncyEq8xbYYheU9cVFOiU/LLW/Q7jRbgys2De7eVBp12RPyC0VF5hDxwh+3gM0shkUBo4xt6VR3yBuNxaIxIK7LS+C64jPDdrPd4RuJv9vZ1jZ4+PCRI8f3D0/sbe3umYootoAeZOlBJvTDpMpClzMbOIMMMk4nu6xe4I16Vy4uqc9D4Nryv7U7rHarzzvy7vbmxs7+wUEkPn7oEL0d7zsGPtnm1uv9AWG7AswbkCod4KATF2p1an5yGmLNWGz6v11amYfAVWd/KuiwOhzBle7djZ2N/SDhw8B7/PiB/fsPDg8P9w0fPLh/+JhmSfEbtH4ZTAd4955Ei7y0jQe0I4sYX6/cvLUu74C3FH/V63A4rL7Yie3bmzvb+kmljxw5dPw4AAPx0aNHJ8bHxo8eHR7rWrC5tX5PSAbSMp7Oyhe3vJKame1dROLF3k+XN+QbcOWdep/DBwFSr+XDpma5h4+ANqOMDw4f7Os7OjExMTY+tndsYqJv75xRrw95WLtDApRMND3CRMOYjnQsLk4vwjpx+mV1eQZcX/y1MOKGwysuBBZbmIAPHDiwfxiV+qhAHju299hEX+tMAMUcYsPMqB6h04BrNKYTA8GRkenF6emR3r+pzDPgirO+6EPccHRl/k0C7gcJo9Ui4v0HQa+PDgPvxPj42DFYe/ceOzoxoGgDtlB2eegPWWkbAftGeK3cuLE2v4Brfuj0EW90yPZm0x4ERhGz2UKdhm3cB1oNeo3EKOO9e/eO92lSIGUA9JwMzcCRAW9vLwGf+PP76/IKuGHDJ8xBoI1Fo9Pefbv2gFdCEYOQDxEwWmpQayA+Og7AY4g8hmIeP7gzbQhxECZo2WYZwUrPtw/1DvXiGvLdWZVXwPWbvmTyhWO4plean0Kr1c92+hDr9IEDx/cfRAEfRaUmGR9jzR47qPFoiZiV2cM2GiOPnvRK7xCu3t6VvyvPK+C6+7+lD0Lgiz7khPJGE4i4bVCYLRYxSrmPRAzEEyjkMeKFNTE8ZQjYBKmHFRrccDLZ6j3BCwT9tY0N+QRccUmrJxiNgQfxLk6v7HlzT3MjifhIxjOhhIePDh88itsYhTwuZIxruNWjFcRSvsZUemdqRQCfGPF+amt9PgFX39KTsMa86DanF4eiHz7VTLEHKvWhjFIfoIALcPsmxEY+Jvfy+PCcPsTINpAw+KS40tJDhfoT8HZiMXzB9+ryCbjm8pkpLQBPj0zDWgm+icSdgvj4IaHWB8kXHx1Hb8z+mHHxr4NjHjfmkCFSZyWe7tIMZboTQ2GfPkdWK0fA5ecsLaeCXggRpkdGekdWwvs+bBTx5WG2W7Aowuzr45BrnKQ8PsaKPTZ+bHx/RE+lIEj/06l0a3uWd2Xa54h+uiaPgBs23NWxPKOPAjAscCMrI51vNXVmImoZYCLwBMVb4I5RxviHiIF8/MASEIM2K2njbF9iVftpKBy0hnNkpnMDXLv+ip7J0YjTi7BD6EpWVibffK+xrXO1c9p/AMIPEO/w0ayIx5B4jPzU2NiBAT1oczqd3LnXubrf5g2H7Y6v5sZM5wa4fuvdAz2jU2nrYu8IAWN7zDv4DhYCKOJirT5wEBNFdsarZDw+NkHaPTF+XBNKGROaifhJTcbpaNRnt//1+to8Al53ZUvP0uis0b6I4iXXCf9ne/+T7zZzjHkItPqAjDCP4kIZg/EiYnwEP4LhvuM7E63jC9MrJ/PGog6n87bc+KXcANd97/MD7XOjswtGc6yXBSx6oIf2fbi98zAFmUdgF0PadLRPxh9orlG8E+P4A+jrG584suep/vjJuOCRFr1BKwCvyyPgikv2t7TPLc3MuxRTdAR0mqIFdKErI5HO9/a90tSPhgszCSx/HByWYqYFEefEeN/xzl3vbh92f6RjPuQFSxh2OJymL+TGEecGuPrLe7t75pamgDjlho2c5cW1aNR0vvLeU9ub246A2dpPi6jBZINGHz1wpG3X9u1Nx+f0Qx8dD5iOeUemo2Gf3WJyXVqRP8CVm1u62yeXZgA4kbTpwotDJxGjoE1Tx/e88tS7776yC3MpsGX9bW2dzU27APWVXf1jKfu/HIZY6fXGwArGokGH3Wny3FmdP8A1m9u72+eWQcILkUQyHbAEp3vFLj5JP326eMuxQ4NAumfPHoi2jwy3zhkt4ZV/dQ15Y7GR3mlvLBz0mS065w8r8we4/JwBAB5FYFciEU/ZAhafd+RfAP9/rBO9i9HoIgRti17QaJCwzv7dmvwBLrqrvasHJDw1P+8CEcdTKWPIYI1ND50i8dC0Nxz1TveOAC9oNAIbrLkJtXICXFv2lxowWsujU7MLAJyIU5vF4zedEvPQdCzqC8coERlZjMXCYZ/V6jSYzyzKG+D6TVd0o4RHZ3ATR5LUV4IEQLH5TfYwziX9v2syyDboC0a93kVMvCDBxi2MKm35WnFt3gCX3t3d3TO5TPNIERcAC+J0GltKTitA9/5bG/rEEIgz6nA4fOEwFou8XuaNiT1s+tam+nwB3nLZ3d1d7XM4gAUqzZs4TSuVQuW2Bdw6pz0Y806PDH3UdmP9Bk1TOOhw2K124MXyNvbQuJpARtqHwLmJLXMCXHfWlZou3sOuBQZG+RJtOhVP0QOjMeTX60xOuxWYwmKB9jrsdrPTaXE6nWYzNR/huXAUZLzoxYqRlLDJcttlW/IFuOrWYQ35YTBaC9gIT6aESsNHUO84vjM+Ti9hd8Xt1rv1Wvhj0Bpg6UwmiwWgzXY7ihgLvjHvImxkknDQYXWadF88uy5fgKtv2buzhQIPttKo0kpGpVPxZDyZSOIS1Aok+VSeDAX8HgDXA7FOZ7KYCBgVgIFRxt5oNEyRlilxU1W+AFdu7t7ZBUYLJIxGS+5hljDKN468iWQiDszJFFszI825BHD8gYlRyKDWYLZIwhBWTjMwWGmrxWQI/G11vgDXbO4C4LkltNIul2uV0aItHI8jbgJFD/s7gUY8LbQbRxHdfiAGZJAwANuxxQzECIy8EHiwhA3mnMSWOQEuP4ckvLQ0hcBspVfJmOSaJFxcrNlphUZdeP4BtrNBB8QWsFtWK9o0UOlFWl4MPBx2sylHsWUugBs23KXZCX54aUoA4+wOECnSasEmTpCIIwKYNrlC85ehkD/gBwFrcRM7LWCmHVYIPLCLQb1hUmmfA7IHe05iy1wA15adp0G3BNkDDkKThNExsd0iI40WC2gj6LMoLomn0jyBySIGCRsQmFTah8BgsyD2YLcU9NkxXfrqhob8AK7fekWrpquD/DBJGAcs0wI4tXoTRyIZnYZPo1LTHBMDm1il7Y4g72Hu/jOw1QmO+CtltXkCXHrdDgSGPTwDftiViLNVErFHPMUmmnU6wu4pzt4JDPXqPQzRh1UCx6hPBdEmBB4AbNHpbs5FqJUL4Lr7rwOVbp/kbIlVmoCJmM43kIRRwKjSbNQUEYXAJgYrzSptMTvtdmuQjRaLGHQaAw9QadNtpXkCXPHtK1s1LRhajoJKRyB7EBOHQsrCD0dYoSNxYaZpyhaNlt+vBatFjhh5MbiM4ibGbAndUjAMwBBq3ZaLKYBcAFfdenAHAE/yHgaujFsSm1gaLRcGJcAcp2AbrZaH/ZKegSnwAJX28R6eZgljxE3AX7ykIj+AIbJs7R6gwGNGWmkSrYg8gA9kjMJ1UfQh00dWadjEsIW1WhOZafLDIvCYpsiDkger2WwyxHMRW+YCuGazplUz0IFlWpDwggBmdZYCJslStEWRFlgtCRxim6U1SStttbLR8lLc4fVGuQJg0ur/pjo/gLchcHvHMgKj1UomTg4tMdJIsBcmz4TAcSFhG+1hvRvdEmm01eqw4jhQLLrIsXSMQy2nRWvKRWyZC+CSc3eihJeX+AQWEKVIgOmMSidZvq6E2MJJjkvYLUGuqHcbeA+L0DIY5ZKHl/wwZQ8gYXMuYsscADcU37UD9rBUaRahrHgQcNYrJXgLc5kvbTPaQiLw0HNouSp5iAErmC1MDymYtmjteQJcu+m81h1dCDw6Mw+RFjieeGpVjYcCj2SSww5OH+jooUIpIqs0JEsGkw51GvawT1hpShC9HGkhsDMXwXQOgCGy3Lujux0ljBUPkCOYZWmiOZamXEnQkoyTnBIbPTwjr5ehJboldMSi4jHtFW4JJOw0WHIRTOcCuPTrrQA8ubwsVTqe5LgDEgRRAcjY6EhilV+Sbglslt6gN1FoSSWPYJiD6UUReYAfNlsMplwE0zkBvg5yB4g7sHs4v8DJwWqbtdovCQEn6aehULYUIpXWaiHSoj3scyBvlApaIGDcxLSHDbrP5iCYzgEwhNI7drYQ8CyWeE4yWlLAkaQwWkQuXqDQeUQ0WtqsSltp6hqAY9OiaonAIGGdLhfBdC6AKZRunyPg2QVMiFBhU5QepngPY9Ig0yVsxcSpzEdGi6paoNI6AxotquKSRkexaEkJMYWWZqfOcNv9W/IBuOrW4xRoYeMBgZNSpTMZItjphEwQpdEilVY8NhFLg4QtXPEAnSaVBre0OD3NBYAgGi2d4Qs5KNTmALj6lmNksyjumMeWuMgNmJirlglR8IhEZFErJfJhiqUxH6Zsycy9B/TDVNQCYrGHATiSg2A6B8AYSlM2PEqRZUbCCuq0rEsnT7LTcVHXxFJtIBQAldZqCdjshNgyyDoNKj0tQkuWsN6dg2A6B8AQSpORHp2B7FBa6WyktSrUkp4YbBZWp41stACY/TBnS9hsyZZpIdwCt4T9GKdJ7/xhTT4Al5yr2UkVrRkMpRfYSIOxyha1GDgirBYWLbnkAfkwWS0hYZ1J+uEw+WHuLYk6rd2i01u+uy0PgBs23oUVLdzCuIddEhiNEkk4vlqnOebihBn9MOxhPIdIe9hA3SXqtQVjWPHAAgAaLVBpiC11etMnSvIAuHb9eTs0A5NYs5yByHKBCrHCQGdKHkkGxRJeQpZpuU4r/TDtYafZYrZaZTdtmivxlC2RSutyMG+pHrh+69d3dA8QL9Y7XKIfznVp/EitB1m4THJkST8ShfJhD1cAANiic1qwYWoNypLHtKzxoNEyabU5mLdUD7yl9Lqd3QOTS6PUSqOipRh5UGThMs79Q6rvoMkS7VRFYbeEKm1AneaGKcaWwTAlDxRccnqIEtbnoFCrHrjue9ft6GqfQ+AZBk4kV4XSItSKUxeN9i/lDlSo51gaQy2tnoEtoreE6VJ0EbcxuyXID50mg/7m0i1rD1zx7SuxOby0NMP1jkimKMmhR0pWtdD/isZDgkMx2VziPWygdIn2cKYwvchVPDBaVsgetLepn7dUD1z95QlNS8fc6NLMLKk0hcqpTGuJei1JsYupCs9uOMVWmo2WX6/VabmoxcE0SniRgTHSIglbtNovqp+3VA9ceYtm58AkV/BoAICrkum0jC451mKVZruVtdJGkS3p9XqSMOX/VuqII/G0rNPipJbJ4I6rn7dUD1yzuQu8kgw7XBQ5ZtNDRe7huMiIk1TES4n7PYw2UdPCBJGKWnazlHBMZsRRuYfdevWHTNUDbzunRUNeaXZWWmmexMtmxCnuiLMrZkecBNlTaGkLhNwBnvPAyrTdacUqHkVa4Im93uweBmCT+thSPXDRud2a9rnRUcr+Mf1fLeB0Nl/idCnTEKcGscJFLTcVeagUjxUAHwXTGFt6IdDKVPEQWH1sqRq4tvivNBoaDudrwYTREsmwIiOtOKfDnBfLoQeOLf2UH7qxbkkFAFJpELE3tqr1ACrt1Ll1nyhac+D6TVdkBlpk/1+6pWzZkjSakclWv0zNCeGIKZgGO23QWWg6DauWLGE5mQbA2DB1G9TPW6oH3no3tkrRDc+T0UquKmkJActRrUiSKjzJl19+//0XXnjpJR7kwQuY3G5qEOtE9hDkcUs0WYuUPPioQ+yG2LJ+rYHr1t2toV44pkpos5LZqqWiZBumcS7Go3zff//9t59//nkgVl57zQN2OkSjWpAtmbKtB44tcbGEcaxFr1UfW6oHPuvzYLPYK80viOwwSWEFbtK0kpJjHrJQC7jPvvrii68++/yvX1JEs8XtxhFEii2xnYZuCeuWi1455EES1upvXrdlrYGrbj2owYklqmct4AkALvFQYJGZP8Q9HInDD+Nl5H31xWeee+65X736/K+fNr7GjhjdsOguEXBY8EazexiyB/cXzqpba+DqLx9jIz2LRstF4+FiD5OAVweXVPRA3ud++7tf/u6fn3n2+ZeeeA1v56FIS1TxYA/LljiOasWEhB0EPKs6tlQNXLm5W9MhvZLMDkUypCiZQq1Q6UjiZQB+5rf/6zf/+E+//OdfPfvE009kWuIm0RI34x7GkWkvOiaWsIOmPLT+tOrYUjVwzeaBbuqFZ4FTSa7hCfmKynSccwfQ6Bef+91vfvHzX/zTb5959tdPv2ZDlaYGsYljSysVtahFvJiZTMPRNIshoFPdE1cNXH7OgAbnaClXIiudzDYeUMhKKlsBSLycjCDwL//x5z//xW9+x8AhUZhGXm6Y+mgWD6PpabbSPocPjJbJEFAfW6oFbii6a6Brcg47w/PzLk6H5QyPklVqDLU42Hr5oxL2hHiqRQ6JZ4DD5JfwCrGwj+u0APzd8jUGri37qy5QaYizZhawgif2cMZorZoRx8SfjRbt4d/gHn7p6dewLo11WjBaFqrT4p1cvnDQS80WJKZzLZgu6fy6M4sa1hYYIsuWFsyV0Akv8JCWLGkp6UxVK5WURY/k+2+/La30q88/TcCim4Y1LcyIfdQh5gTRK5pLNNai82u/prZFrBq49O6urg52wwsnAdMeTiuZnqnI/pNopl/81XPPPQN++KWXXqPOg59nPLBBLOdpg3zMA7Gj0SCNpkFsqVd9lkctcN1ld3e1TC5LYDRacihJ7OBMj1gWPID4bY60XnhJeSIzfJg56GF3UIKILfEYaTRZaazxAPDNpWsNfNbnuwYmufcvJcwTD8qqQItK8XFR5KFY+u23n4f0AWJpOuRCvRaueFB+SME0DvIIleYpDwJWe5OYWuCqW/u6B+YoVRLEmNzHs3EWT+Ml40mxh1mrX4Bs6QUl/QS3HlCnwS1hPmzONExFCQDvPczsYYgtz15j4Oovt2rwMDxrtATmzpKSVpRMshTPlC0p2H45/g/YIFZE+9Cvp+6hiSfEHfLsErbSuGrJEtb7Zy6tWlvgys0DXQNzo1iwRGBQ6biIOzJuWJQAkDgiawC4y/9BdsSpAqDVUqDFB3lQo+ncQyyWtdIIHDCqPcujFrhmc09X+xzWs1CjueAhW0vZXUy8kaxO445OZ7ppIT4DoMvOLaFbCrKAcQKAx0vtFpM+oFUbW6oFLj+np6UHJTzPcQeP2aXYI8ltLM89JIRnSspaPd29Q/lwZjKN2mmiJ85+WKg0ZQ8QTNesKXDDhrvaW3qWpjICpsnSjHhZxlSaTmJoKRxTJC5f5DF6+NRDdhQP54ellY6RTofDWInH/qHer1U7fqgSuLbsvIGWjqUZtlguodKZxMEoYumM1WIJZ861GOniaeqmSWAaEXeIQi0C8zhtUEhY/zmV44cqgeu3fr0FvZIAzsz/s4QpV1JEGS+ekLgJ6jxQFYgOIJKEDTzVIopasoyHvyAiGoZIKwOsdvxQLXDp3QMtEHdgNQuBXTiVJgY4eMXTsoGY3cSZKR4+5UHXTePooSUzXcqVaQy0Mlaami1+/7dUlvFUAtfdfzdKmIBdGQmTBTamjUrGasVlRpyUw6UcnBh5D4sRABOP4rHRCopNDAJGYKudgT9burbA3/58S/vy6KxQ6Uj2PDyeEZZVy+zkkog+hOei9mEo45Zoiscsz0yHpR+OEjBeTY7Af6byLI9KYIws6ZqleQSmzhL3FHDAP1MAyNRps45YzjxQmZZUmkItPqklR7UwfSAZsx92WgzuQM/ZawpcfcuOrh6sd1Cm5HJJ4KzVIhHH5SSPELLsL2I3jSIPPU+10B42W33CaEXZSofliLjF4A/NqBw/VAmMJbweUmnySRGu8FBnME1eSckcQOSEOMmjabIMpGQCDzok7sTZQ3Eqni9+XfRG+fQhWmmQsEdRGVuqBN4GoXTPMt11QMDZ7jDjKmmPG+XtToF4Q0ok6TLi9ZWpBPwEjH69X7GBIvsxPzQFrY6wnTsPeFYLh9OkH8ZxWgcnxDa9ythSJXDJuQg8OrsgnDAPSwtiFHKo50gglU72u9IJ45H2VNyjaWtuHI4bk/HA7PHBbp3n2OFj+BtbrKn9bW37U8EMcJALtVGRDqNKY4fYo7982xoCN2y8q6WrY5WEI1LCHEsb0wFNox6AmxbSyVBnd9rW1rR3rmVw15LN07PrwN49B9v6Nf3NAb9Z03QskWht2uHjs1pkpSnWovSQSh5OHHrw+D9TsobAtevP62rpWEabFQERL+DJUh7gkDYr0NXmTinJPfPppKez232o0eNJK9rWpnioWWMyGJsP6Qzmw33hqaa4z2kPe5qmgjTWwqcASL5RcSieJ7U8gc+pGz9UBwyRZffA5PLU/IIMOyIUN6bZBMPyd3W64wDsSidtnQPxpnkFJx/8/eNKU1yJ6wa7tYphoD/ar7G7DTpDeKDfh9kDD9SGWaejAthMwJ6vqBs/VAe8pfQ6nODhUBosFoaW4ny4SJVQwmkAXlCSobb2pebmpj20+j1NESWtHdTojdqWQWezYsKE2BxopOOWYiheqDTOD/scDlBpndvjURlbqgOGyDID7MKJFnGUUrYdQKU1qNIpkHDC1jYw1RSZxTU/70ruidgI2GboHrQ2uywYWlpTjXbwSpQfBrlCS/m/aBCDWwrZvqVu/FAdcMW3rwTgJTqBt+CaXwUsk8PAQKNBCaWbXKGUu3HA06QxwKc9EGdH9iQURduPEu4ajB08HDQZdM7w8eGwyJZkRpxxSxRauj22z6qLLdUB461DkDvMCitNkRZnQpgQG+mqjj0TqcRgc78rPt6cNk7uao3bbKN7DgYSexLGFElY3zXodDceCFgd+v2NJisHHqvcEtel8eQS7mFjyyVrCFx9S6umfZKBZWzJQ0tYkKRUyRPvbGo6FDrQ1NQcSUU8U41Njc1Ne0PpxK6IMa1tbNXaDDs6LXrD/ua2tuYDTodZFqZp/DBKOo25g5VUWm9TltXFluqAeexwiUbwEJgPDyezWxiYbf5kKpAOpRK2NMSWKdtsz3Laho01dNZJGvIwQrrk0EcS2jCdIHZguiRrHuyGeQRAByqdTqiLLdUB44GWDDBHW5nyjdjGBB9PJankgbN4YMKpiqfQXWppnFty05Fpp91iwmaa2eoQVTy8RizKxDwCAMAp5fKatQMuOVejae/AvsMCJYicPMQlL/fTKP/PThAn5FEtmi8V+aHfLZtLpNJWn7gojpwSz3hQN80fShvVxZaqgCGyJOBMVZqqlknph1dNtQAd54XibAuaNh4EyVzWIjriomzJ7bSosFnolXie1pNKq4stVQHXrz9Pg7cd4uw/LnkeXl61Q0U8UbVMiipthIfT4uIXyIlTADyZRkfEZdmSDy+hG+buIQDDHg6l0+piS3XAW6/AU4d0ydLCvKxLy6uFlNUN09UKLQZqpTHnMh4lxFzUIkcsfvMLp0vBVXs4/t9VxZaqgLeUfp3v0ZoB3nk5xBMXCXFajgCkTzp+yOO0sj/BlwL6AzTlYaLzpdhc8jlAwlGai6dQiySM6WEoHf+SqthSFTAeaOkeoJPhJGERecTpGmfeIgAABm1JREFUzqHMIJ4s4a06JR6Rh+Lpt3yKi/FIwiYn313ChVqSLxXiSaUtDKwqtlQFjLcOdbfMLWE+vCBijwTftcSbOCUO8sRTXIZPRvB2mghN3CblIXFbyMPDh7JOK3sPQsJYAciUeELp5JdUHW1RBVx9634GhmBajjzwJY/Zg0vYLE1mtrCL93AkKYAVRVxtIW7yEK0HNtN0ekkWAPC+T1LpRKuqO4hUAVfSrUMMjHuYRZzMOOJ05si01GeXuL0kkRT+GoyWmKeVDVPpiCm4ZDtNgQeVaf2etKvr1qq1Aq7ZjHfS8G2H83Q6nDcxzzysvtmSgCN8RNxFnon9ksJmehUwO+JsLZ4iD9F5QJVWXKO3VK8V8DYApsPw2BCfXRCjeElxl1L2tqVkRsKJCHUnEpHMuQcZa/EwHrslzhCpUktuOCqLeDpQ6cjs5pq1Ai45txX2sLhmiaMtnluiorMQr5iW5hsAXOIvGV2KIYBMS1wnhg+z6QPl/+GMhD1KxHX5WgFDZNnaKq4dlgPxC8JqwSZOZW89FFfxECyLWJwToIMt4vShwSBnHqzmrEpLYLqOR6cNKYmFtQPe8JctO7rxNPzSFBKLUR7SV9FQoUtpsFqNu5vEKy7GE+em8Yop/mW9gC2EbHLSeAtf6CGQsQBgdzox0ookLl+zPVx56eTsEqxlfKc1J94mJ/EDrUn4ww/E5+YmJ5fl0x1zHfBhcnKyA/9NH/mvjsmODnznr8RH9Ok50KbJC9fMLdUXfWaBeZcJmP9aWp6jp/DHsDS6TD+OpeXRJfkU/SU+0GdHl+U3gbdRfnJulF4tv7V8CazI3xWtWWj5eF3Z51z0H2IhS25+yP/l1T8J8ZKlpbnMI6EemZ8GfTOiHp1j5FH68iXBv+z6TNka1rQer/relxYmSXlZg5fnWGuX5lbpNz5B/2N6sCx/QvSp7LPwkD4gN79qbk6+grcLfvfIVy5b03ZpQ80lf2aUPX7hhFLCG6HF4gvT+cBDQrgmefkhBl7SjOHdRHRDoCt7kVxC3nXKXoyeMH72kso1neJ5vL78P7/yyruvvCvWU/T2Cj61ffv2XXI17WlubOzkX681OIi/cmqwn37PFv7iqUNHDg/2d3byb/7EBf9sg5e39bfRb9U7PIifbm6Gb9Df+eXy+scb1qgA0NDQUFtbX1H2Jx++/vqbr7/5JvyN6/XXX38S/v3kk6/j+1tPvvUWvb/zzlsfvPEOvn3wxgf8/tY78Pcbb3yAz8KC596Rn4LPvfPBO/Q1+BXw8K23Pnjnrdf/a1l1XV19fX1tw6lSn6aCtr6urqq6puiO0977cPeHsHaL9+za/d7uD3fv3rdvNzyAD/s+3A0P4RH+gc/ufu+9ffvgDd7fo+d287/5n/Rx9z56DX4PePQnd6wvKimvqa4C6lNkPu2Ueeu3IG55UfF9/+mPH/vxT38Kbx9ZP/7pj2k9+GDmw4MPPvjYg7weg3Xv9Y/de+/1119Pj+n93uvvpUeP4dP30qPH4EvowfV//MA1j6zbVFxEyFvqT4n4lIFrEbhyW8mGstJHbn/g0au+8/0f/eRn3/zmN/8nrf9B6xvf+Ptv/P0pLPiyb/B34O8G3/ZnP/nR96964PZrHrlva9mGkm2VCFz7ewQm4vq6iqrK8pINxZtKH37kjmuuvv0H99zzwKOPPvTQVVdd9Z3vfOf7sH5E6ydi/ez/suRr+Cvwa+FbwDd66KFHH33gnnt+cPvV19zxyH2l64s3lJRXVlXU1Z8arzqjhcwAXV2zrbykaGNx2aat6+57GNjvuOOaa66++urbb7/9B7DugfUArkflemjVyjxJL8HX4tfAl8I3uOYa+FaPPPzwfeu2bior3gjbdxsoc0XdKdPmwC01kPUC9QbwqurKGmAvLykpKtqwcWNxcVnZ+k2btm4tLS1dt+4+WA/zeuSkJZ7Ez69bBy/dunXTpvVlZcXFGzduKCoqKSkHyprK6ioE3cL2uWEN/fAqdJI5OCrAB35YFfAzgJ9CdXUlrBpa2/4Piz+Lr4OX41dVVNC32LIFfVAtyTOvfuHyv6kF5LTx58Gr/qQPtfQp8bKP+T/z+wDOq1UALgAXgAvABeACcAG4AFwALgAXgAvABeACcAG4AFwALgAXgAvABeACcAG4AFwALgAXgAvABeACcAG4AFwALgAXgAvABeACcAFYzfrfJ8BmeDpFemMAAAAASUVORK5CYII=);\n}\n.wemo_sensor .smart-tile .description span.mode-1,\n.wemo_sensor .smart-tile .description span.mode-2 {\n    color: #73D44C;\n}';});

define('widgets/wemo_sensor/js/model',['Cache'],
    /** @exports model class and instantiated model */
    function(Backbone) {

        'use strict';

        var mockPath = 'widgets/wemo_sensor/mocks/';

        var Model = Backbone.WemoDeviceModel.extend({
            /**
             * default data values
             */
            defaults: {
                'binaryState': 0,
                'appState': 0,
                'statusTS': 0,
                'defaultFriendlyName': '',
                "defaultIcon": "file:///android_asset/www/img/new_icons/WeMo_Motion_@3x.png"
            },
            /**
             * validation fields, uses Backbone.validation
             */
            validation: {
                'binaryState': {
                    required: true
                },
                'statusTS': {
                    required: true
                }
            },
            /**
             * set the native get command
             */
            getCommand: 'GetBinaryState',

            /**
             * urls allow dummy data to be loaded for demo/test
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
define('hbs!widgets/wemo_sensor/templates/tile',['hbs','handlebars'], function( hbs, Handlebars ){ 
var t = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [3,'>= 1.0.0-rc.4'];
helpers = helpers || Handlebars.helpers;
  


  return "<header class=\"row-tile\">\n    <div class=\"tile1\">\n        <div class=\"gradient\"></div>\n        <span class=\"icon\" data-bind=\"iconURL\"></span>\n    </div>\n    <div class=\"tile2 description\">\n        <h1 data-bind=\"friendlyName\"></h1>\n        <span class=\"line2 current_mode\" data-bind=\"mode\"></span>\n    </div>\n    <div class=\"tile3 alternative-spinner power\">\n        <span class=\"css-spinner\"></span>\n    </div>\n</header>\n";
  });
Handlebars.registerPartial('widgets_wemo_sensor_templates_tile', t);
return t;
});
/* END_TEMPLATE */
;
define('widgets/wemo_sensor/js/tile',['backbone', 'hbs!widgets/wemo_sensor/templates/tile'],
    /** @exports tile view */
    function(Backbone, template) {

        'use strict';

        var View = Backbone.TileBaseView.extend({
            template: template,
            /**
             * adds event binding to elements, clicks are converted to pointerup events
             */
            events: {},
            /**
             * two-way data binding to models, uses Backbone.stickit
             */
            bindings: {
                '*[data-bind="friendlyName"]': {
                    observe: 'friendlyName',
                    updateMethod: 'html'
                },
                '*[data-bind="mode"]': {
                    observe: ['appState', 'statusTS'],
                    onGet: function(values) {
                        var valToShow = '';
                        if (this.isRemote) {
                            var ts = 0;
                            if (values[1] === '') {
                                ts = this.model.get('statusTS');
                            } else {
                                ts = values[1];
                                this.model.set('statusTS', ts);
                            }
                            if (parseInt(ts) !== 0) {
                                valToShow = this.getMotionSenseTimeMsg(new Date(parseInt(ts, 10) * 1000));
                            }
                        } else {
                            this.$mode.attr('class', 'current_mode mode-' + values[0]);
                            valToShow = this.i18n('state', values[0]);
                        }
                        return valToShow;

                    }
                }
            },
            /**
             * localizes the template, and inserts it into the document fragment. Also binds the DOM events
             */
            render: function() {
                this.delegateEvents();
                this.$mode = this.$('.current_mode');
            },
            /**
             * put non-DOM event listeners here. These need to be removed when no longer necessary to free up memory (this.stopListening())
             */
            listen: function() {
                this.listenTo(this.model, 'change:binaryState', this.updateState);
            },
            /**
             * Updates sensor state in the app based on mode changes
             */
            updateState: function() {
                var currMode = parseInt(this.model.get('binaryState'), 10),
                    appMode = parseInt(this.model.get('appState'), 10),
                    self = this;
                currMode = isNaN(currMode) ? 0 : currMode;
                if (appMode === 0 && currMode === 1) {
                    this.model.set('appState', 2);
                    var time = setTimeout(function() {
                        self.model.set('appState', 1);
                    }, 1000);
                } else {
                    this.model.set('appState', currMode);
                }
            },
            /**
             * Returns the Motion Sensed message based on date
             * @param {date} date [date of last motion sensed]
             * @returns {string} strDate [formatted string based on date]
             */
            getMotionSenseTimeMsg: function(date) {
                var MMDD = new Date(),
                    strDate = '',
                    temparr = '';
                MMDD.setDate(date.getDate());
                MMDD.setHours(0, 0, 0, 0);

                var today = new Date();
                today.setHours(0, 0, 0, 0);

                var yesterday = new Date();
                yesterday.setHours(0, 0, 0, 0);
                yesterday.setDate(yesterday.getDate() - 1);

                if (today.getTime() === MMDD.getTime()) {
                    temparr = this.i18n('state', 3);
                    strDate = temparr + ' ' + this.sandbox.util.customDateFormat(date, '#hh#:#mm# #AMPM#');

                } else if (yesterday.getTime() === MMDD.getTime()) {
                    temparr = this.i18n('state', 4).split('%@');
                    strDate = temparr[0] + ' ' + this.sandbox.util.customDateFormat(date, '#hh#:#mm# #AMPM#') + ' ' + (temparr[1] ? temparr[1] : '');
                } else {
                    temparr = this.i18n('state', 3);
                    strDate = temparr + ' ' + this.sandbox.util.customDateFormat(date, '#MMM# #DD#');
                }
                return strDate;
            },
            /**
             * sets up the button to show/hide drawer cross-platform
             */
            afterInitialize: function() {

            }
        });

        return View;
    });
define('widgets/wemo_sensor/main', ['text!widgets/wemo_sensor/css/main.css','widgets/wemo_sensor/js/model','widgets/wemo_sensor/js/tile'],

    function(css, data, TileView) {

        'use strict';

        return {
            type: 'TileAndDrawer',
            styles: css,
            Tile: TileView,
            Model: data.Model
        };

    });
}());