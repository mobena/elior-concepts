<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Controller\Admin;

use AppBundle\Entity\Post;
use AppBundle\Form\PostType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;

/**
 * Controller used to manage dashboard contents in the backend.
 *
 * @Route("/admin/dashboard")
 * @Security("has_role('ROLE_ADMIN')")
 *
 * @author Mohamed Benabdallah <moamben@gmail.com>
 */
class DashboardController extends Controller
{
    /**
     * Dashboard Controller
     *
     * @Route("/", name="admin_dashboard_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        //$em = $this->getDoctrine()->getManager();

        return $this->render('admin/dashboard/index.html.twig', array());
    }
}
