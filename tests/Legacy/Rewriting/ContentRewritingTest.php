<?php

/*
 * This file is part of the Thelia package.
 * http://www.thelia.net
 *
 * (c) OpenStudio <info@thelia.net>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Thelia\Tests\Rewriting;

use Thelia\Model\Content;

/**
 * Class ContentRewritingTest
 * @package Thelia\Tests\Rewriting
 * @author Manuel Raynaud <manu@raynaud.io>
 */
class ContentRewritingTest extends BaseRewritingObject
{
    /**
     * @return \Thelia\Model\Content
     */
    public function getObject()
    {
        return new Content();
    }
}
