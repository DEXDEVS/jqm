<?php 

    $userID = Yii::$app->user->id;
    $user = Yii::$app->db->createCommand("SELECT user_photo FROM user WHERE id = $userID")->queryAll();
    // Student Photo...
    $userPhoto = $user[0]['user_photo'];
?>
<style type="text/css">
    .main-sidebar{
        color: #ECF0F5;
        background-color: #001F3F;
    }
    .main-sidebar a{
        color: #ECF0F5;
    }
    .sidebar a:hover{
        font-weight: bold;
        background-color: #000000;
        color: #ffffff;
    }
</style>
<aside class="main-sidebar">

    <section class="sidebar" style="overflow-y: visible; ">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php echo '../frontend/web/'.$userPhoto; ?>" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>
                    <?= Yii::$app->user->identity->username ?>
                    <!--  -->
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <!-- <div class="input-group">
                <input type="text" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div> -->
        </form>
        <!-- /.search form -->
        <?php if(Yii::$app->user->can('navigation')){ ?>

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    // ['label' => 'Menus', 'options' => ['class' => 'header center']],
                    ['label' => 'Home', 'icon' => 'dashboard', 'url' => "./home"],
                    //['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii']],
                    ['label' => 'Login', 'url' => ["../login"], 'visible' => Yii::$app->user->isGuest],

                    // ------------------------------------------------
                    // Student Module start...
                    [
                        'label' => 'Students',
                        'icon' => 'graduation-cap',
                        'url' => '#',
                        'items' => [
                            //['label' => 'Inquiry', 'icon' => 'caret-right', 'url' => ["/std-inquiry"],],
                            ['label' => 'Registration', 'icon' => 'caret-right', 'url' => ["/std-personal-info"],],
                            ['label' => 'Inactive Students', 'icon' => 'caret-right', 'url' => './std-personal-info-inactive',],
                            ['label' => 'Attendance', 'icon' => 'caret-right', 'url' => './attendance',],
                            //['label' => 'Exams Report', 'icon' => 'caret-right', 'url' => './exams-report',],
                            [
                                'label' => 'Attendance Reports',
                                'icon' => 'caret-right',
                                'url' => '#',
                                'items' => [
                                    ['label' => 'Date Wise', 'icon' => 'chevron-right', 'url' => './view-attendance',],
                                    ['label' => 'Month Wise', 'icon' => 'chevron-right', 'url' => './monthly-class-atten-view',],
                                ],
                            ],
                            // ['label' => 'Enrollment', 'icon' => 'caret-right', 'url' => ["/std-enrollment-head"],],
                            // ['label' => 'Promotion/Demotion', 'icon' => 'caret-right', 'url' => ["./premium-version"],],
                            // ['label' => 'ID Cards', 'icon' => 'caret-right', 'url' => ["./premium-version"],],
                            // ['label' => 'Attendance System', 'icon' => 'caret-right', 'url' => ["./premium-version"],],
                            // [
                            //     'label' => 'Online Admission',
                            //     'icon' => 'caret-right',
                            //     'url' => '#',
                            //     'items' => [
                            //         ['label' => 'Announcment', 'icon' => 'chevron-right', 'url' => './premium-version',],
                            //         ['label' => 'Merit Module', 'icon' => 'chevron-right', 'url' => './premium-version',],
                            //         ['label' => 'Scholarship', 'icon' => 'chevron-right', 'url' => './premium-version',],
                            //         ['label' => 'Entry Test', 'icon' => 'chevron-right', 'url' => './premium-version',],
                            //     ],
                            // ],
                            //['label' => 'Promotion/Demotion', 'icon' => 'caret-right', 'url' => ["./std-promote"],],
                            
                            //['label' => 'Class', 'icon' => 'caret-right', 'url' => ["/std-class"],],
                            // ['label' => 'Students Enrolment', 'icon' => 'caret-right', 'url' => ["/std-enrollment-head"],],
                            // ['label' => 'Assign Teacher', 'icon' => 'caret-right', 'url' => ["/teacher-subject-assign-head"],],
                        ],
                    ],
                    // ------------------------------------------------
                    // Employee Module start...
                    // [
                    //     'label' => 'Employees',
                    //     'icon' => 'users',
                    //     'url' => [""],
                    //     'items' => [
                    //         ['label' => 'Employee Registration', 'icon' => 'caret-right', 'url' => './emp-info',],
                    //     ],
                    // ],
                    
                    // ------------------------------------------------
                    // Msg of Day start...
                    // [
                    //     'label' => 'Communications',
                    //     'icon' => 'comments',
                    //     'url' => '#',
                    //     'items' => [
                    //         ['label' => 'Message of the Day', 'icon' => 'caret-right', 'url' => "./msg-of-day"],
                    //         ['label' => 'Events Management', 'icon' => 'caret-right', 'url' => "./events"],
                    //         ['label' => 'Notice Management', 'icon' => 'caret-right', 'url' => "./notice"],
                    //         ['label' => 'Complaint Box', 'icon' => 'caret-right','url' =>"./premium-version"]
                    //     ],
                    // ],
                    // ------------------------------------------------
                    // System Settings start...
                    [
                        'label' => 'System Settings',
                        'icon' => 'cogs',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Institute', 'icon' => 'caret-right', 'url' => ["/institute"],],
                            ['label' => 'Branches', 'icon' => 'caret-right', 'url' => ["/branches"],],
                            ['label' => 'Classes', 'icon' => 'caret-right', 'url' => ["/std-class-name"],],
                            ['label' => 'Paraay', 'icon' => 'caret-right', 'url' => ["/paraay"],],
                        ],
                    ],
                    // System Settings close...
                    // ------------------------------------------------
                    // SMS start...
                    [
                        'label' => 'Phone Book Directory',
                        'icon' => 'phone-square',
                        'url' => 'phone-book',
                    ],
                    
                ],
            ]
        ) ?>
        <?php } ?>

    </section>

</aside>
