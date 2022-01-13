from tkinter import *
window=Tk()
def hs():
    print("点击一次")
window.title("sj")
Button(window,text="点击一次",width=5,command=hs).grid(row=0,column=0)
