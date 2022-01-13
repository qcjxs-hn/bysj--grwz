import random as r

class Fish:
    def _init_(self):
        self.x = r.randit(0,10)
        self.y = r.randit(0,10)

    def move(self):
        self.x -= 1
        print("我的位置是：%d%d",self.x,self.y)

class Goldfish(Fish):
    pass

class Carp(Fish):
    pass

class Salmon(Fish):
    pass

class shark(Fish):
    def _init_(self):
        super()._init_()
        self.hungry = True

    def eat(self):
        if self.hangry:
            print("吃了")
            self.hungry =False
        else:
            print("太撑了，吃不下了！")
    
