<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace AppBundle\Controller\Front;

use AppBundle\Entity\Concept;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;

/**
 * Controller used to manage concept contents in the frontend.
 *
 * @Route("/concept")
 *
 * @author Mohamed Benabdallah <moamben@gmail.com>
 */
class ConceptController extends Controller
{
    /**
     * Concept Controller
     *
     * @Route("/", name="front_concept_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $concepts = $em->getRepository('AppBundle:Concept')
            ->findBy(array('conceptStatus' => 1, 'deletedAt' => null,)); # status enabled, and not deleted ! #

        foreach ($concepts as $concept) {
            $conceptsMedia[$concept->getId()] = $em->getRepository('AppBundle:ConceptMedia')
                ->findBy(array('concept' => $concept->getId(), 'deletedAt' => null,));
        }

        return $this->render('front/concept/index.html.twig', array(
            'concepts' => $concepts,
            'conceptsMedia' => $conceptsMedia,
        ));
    }

    /**
     * Finds and displays a Concept entity.
     *
     * @Route("/{id}", name="front_concept_show")
     * @Method("GET")
     */
    public function showAction(Concept $concept)
    {
        $em = $this->getDoctrine()->getManager();

        $concepts = $em->getRepository('AppBundle:Concept')
            ->findBy(array('id' => $concept, 'conceptStatus' => 1, 'deletedAt' => null,));

        foreach ($concepts as $concept) {
            $conceptsMedia[$concept->getId()] = $em->getRepository('AppBundle:ConceptMedia')
                ->findBy(array('concept' => $concept->getId(), 'deletedAt' => null,));

            $conceptsProducts = $em->getRepository('AppBundle:ConceptProduct')
                ->findBy(array('concept' => $concept->getId(), 'deletedAt' => null,));

            $conceptsProductsMedias = array();
            foreach ($conceptsProducts as $conceptsProduct) {
                $conceptsProductsMedias[$conceptsProduct->getProduct()->getId()] = $em->getRepository('AppBundle:ProductMedia')
                    ->findBy(array('product' => $conceptsProduct->getProduct()->getId(), 'deletedAt' => null,));
            }
        }

        return $this->render('front/concept/show.html.twig', array(
            'concepts' => $concepts,
            'conceptsMedia' => $conceptsMedia,
            'conceptsProducts' => $conceptsProducts,
            'conceptsProductsMedias' => $conceptsProductsMedias,
        ));
    }
}
