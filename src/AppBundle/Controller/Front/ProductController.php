<?php

namespace AppBundle\Controller\Front;

use AppBundle\Entity\Product;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;

/**
 * Controller used to manage product contents in the frontend.
 *
 * @Route("/product")
 *
 * @author Mohamed Benabdallah <moamben@gmail.com>
 */
class ProductController extends Controller
{
    /**
     * Finds and displays a Product entity.
     *
     * @Route("/{id}", name="front_product_show")
     * @Method("GET")
     */
    public function showAction(Product $product)
    {
        $em = $this->getDoctrine()->getManager();

        $products = $em->getRepository('AppBundle:Product')
            ->findBy(array('id' => $product, 'deletedAt' => null,)); // get all products even those disabled, ie : 'productStatus' => 0,

        return $this->render('front/product/show.html.twig', array(
            'products' => $products,
        ));
    }
}