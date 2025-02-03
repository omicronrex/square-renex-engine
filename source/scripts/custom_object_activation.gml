///custom_object_activation(gameplay)
//this activates/deactivates objects that are outside the view,
//in order to preserve resources.
//objects inside the view are always active.

//instances that should always be active
instance_activate_object(gm82core_object)
instance_activate_object(ActiveParent)

//during gameplay
if (argument0) {
    Player.activated=true
    instance_activate_object(ActiveIngame)

    //parents
    instance_deactivate_object(Block)
    instance_deactivate_object(SlopeParent)

    instance_deactivate_object(PlayerKiller)
    instance_deactivate_object(PlayerKillerActive)
    instance_deactivate_object(DotKiller)

    //we actually want to keep cherries & avoidance bullets active
    //as those can commonly go offscreen and back
    instance_activate_object(Cherry)
    instance_activate_object(AvoidanceBullet)

    instance_deactivate_object(SavePointParent)

    instance_deactivate_object(Trigger)
    instance_deactivate_object(Triggered)
    instance_deactivate_object(TriggerLock)
    instance_deactivate_object(Button)
    instance_deactivate_object(ButtonShoot)

    instance_deactivate_object(KeyParent)
    instance_deactivate_object(KeyBlockParent)

    instance_deactivate_object(ItemBlock)
    instance_deactivate_object(SolidItemBlock)
    instance_deactivate_object(Item)
    instance_deactivate_object(GlobalItem)

    instance_deactivate_object(MovingSolid)
    instance_deactivate_object(VandalCherryBase)
    instance_deactivate_object(AnyWater)

    //common objects
    instance_deactivate_object(WallJumpL)
    instance_deactivate_object(WallJumpR)
    instance_deactivate_object(JumpRefresher)
    instance_deactivate_object(GravFlip)
    instance_deactivate_object(GravNormal)

    instance_deactivate_object(ConveyorLeft)
    instance_deactivate_object(ConveyorRight)
    instance_deactivate_object(PushBlock)
    instance_deactivate_object(LongPushBlock)
    instance_deactivate_object(PushBlockSave)
    instance_deactivate_object(LiftBlock)
    instance_deactivate_object(MoveBlock)
    instance_deactivate_object(YokuBlock)
    instance_deactivate_object(SlipBlock)
    instance_deactivate_object(M9Block)
    instance_deactivate_object(M9Trigger)
    instance_deactivate_object(DingBlock)
    instance_deactivate_object(FakeBlock)
    instance_deactivate_object(BreakBlock)
    instance_deactivate_object(DemoBlock)

    instance_deactivate_object(FunnySlope)
    instance_deactivate_object(GateUp)
    instance_deactivate_object(GateRight)
    instance_deactivate_object(GateLeft)
    instance_deactivate_object(GateDown)

    instance_deactivate_object(Ladder)
    instance_deactivate_object(Signpost)

    //gimmicks
    instance_deactivate_object(WhiteDotEnable)
    instance_deactivate_object(WhiteDotDisable)
    instance_deactivate_object(WhiteDotKiller)
    instance_deactivate_object(DotkidEnable)
    instance_deactivate_object(DotkidDisable)
    instance_deactivate_object(DotkidKiller)

    instance_deactivate_object(SpinFlip)
    instance_deactivate_object(SpinNormal)
    instance_deactivate_object(KidBlockUp)
    instance_deactivate_object(KidBlockDown)
    instance_deactivate_object(WCSpikeSwitcher)
    instance_deactivate_object(WCSwitchSpikeParent)

    instance_deactivate_object(StarSingleJump)
    instance_deactivate_object(StarDoubleJump)
    instance_deactivate_object(StarTripleJump)
    instance_deactivate_object(TripleJumpEffect)
    instance_deactivate_object(LowGravField)
    instance_deactivate_object(HighGravField)
    instance_deactivate_object(LowSpeedField)
    instance_deactivate_object(HighSpeedField)
    instance_deactivate_object(ShootkidEnable)
    instance_deactivate_object(ShootkidDisable)
    instance_deactivate_object(ShootKid)

    instance_deactivate_object(PastelSpikeBlack)
    instance_deactivate_object(PastelSpikeBlue)
    instance_deactivate_object(PastelSpikeGreen)
    instance_deactivate_object(PastelWater)
    instance_deactivate_object(PastelWater2)
    instance_deactivate_object(WaterStopper)

    instance_deactivate_object(BeamOneJump)
    instance_deactivate_object(BeamHighSpeed)
    instance_deactivate_object(BeamHighGrav)
    instance_deactivate_object(BeamLowGrav)
    instance_deactivate_object(BeamNormal)

    instance_deactivate_object(VCoinGive)
    instance_deactivate_object(VCoinTake)
    instance_deactivate_object(VLineFlipper)

    instance_deactivate_object(JumpSwitchBlock)
    instance_deactivate_object(JumpSwitchBlockOff)

    instance_deactivate_object(SMWSaw)
    instance_deactivate_object(Muncher)

    instance_deactivate_object(MegamanPiston)
    instance_deactivate_object(GuyFireTrigger)
    instance_deactivate_object(Cloud)
    instance_deactivate_object(CloudBolt)
    instance_deactivate_object(GuyCouch)
    instance_deactivate_object(CautionStripL)
    instance_deactivate_object(CautionStripR)
    instance_deactivate_object(CautionFastL)
    instance_deactivate_object(CautionFastR)
    instance_deactivate_object(DumbBugz)
    instance_deactivate_object(DeadBugz)

    instance_deactivate_object(ShootBlock)
    instance_deactivate_object(ShootBlockBig)

    instance_deactivate_object(JumpBlock)
    instance_deactivate_object(VandalAcidBlob)

    instance_deactivate_object(OneTimeWater)
    instance_deactivate_object(GravUpBlock)
    instance_deactivate_object(GravDownBlock)

    instance_deactivate_object(DownWater)
    instance_deactivate_object(UpWater)
    instance_deactivate_object(ShootRefresherL)
    instance_deactivate_object(ShootRefresherR)

    instance_deactivate_object(CoinFlip)
    instance_deactivate_object(CoinNormal)
    instance_deactivate_object(ClockOn)
    instance_deactivate_object(ClockOff)
    instance_deactivate_object(ReverserOn)
    instance_deactivate_object(ReverserOff)
    instance_deactivate_object(ToggleBlockOn)
    instance_deactivate_object(ToggleBlockOff)
    instance_deactivate_object(Teleporter)
    instance_deactivate_object(PatBall)
    instance_deactivate_object(AlignIndicator)
    instance_deactivate_object(InfiniteJump)
    instance_deactivate_object(ExampleNpc)

    //miscellaneous
    instance_deactivate_object(TextDraw)
    instance_deactivate_object(Coin)
    instance_deactivate_object(Blood)
    instance_deactivate_object(PropBlood)
    instance_deactivate_object(GibParticle)
    instance_deactivate_object(BloodEmitter)
}
