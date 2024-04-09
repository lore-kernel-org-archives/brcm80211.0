Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51412D744
	for <brcm80211@lists.linux.dev>; Tue,  9 Apr 2024 12:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712667073; cv=none; b=BAgiHJcaXaYI0p8NKP8IHJdRjafcLUwARDlnNaTeLr/ZB1NgJ3+Yi66Gt6z8fw6MTbW32ybVB4/WLgpRRs/AjYrERf3nFlJhAlr36eITnqjZEUVhM8vOHixMCzN+O12nXLrebyBDlSncP037ko1yS8D9Ggx1EQpoJAf9V+yjJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712667073; c=relaxed/simple;
	bh=qLaR1T3JCwD+pcaCnaUzLtRoSUp8R3ZkvQx5FcERa6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF9ErtCtOvgSYuQYwGj3PQwEpNc94r2v7/bzXyZkTFI3LJGUkBNf9UAC3INQdZ3pk6MzAkXS46HNmTtIzFZMMhB1EwBI1XxRUTRp22NDVBteIfXnQmJLacqG7mir9zjJszbItgxIy8YN+/EQVdKFyRLoxY4BGX8JnPv9A+Td3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShPgUEN7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShPgUEN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712667072; x=1744203072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qLaR1T3JCwD+pcaCnaUzLtRoSUp8R3ZkvQx5FcERa6E=;
  b=ShPgUEN7wZWsQr39HEtPDzYR5Ev2O41m/X4L9ut35EXkiyrrLky0sP/m
   TS1rqT9PfUizKMxsArzrDCAI+z1obX76NLLW15XPLxxdpP632/roDHSVW
   bDKxD/UkiDpFvVKtPWfM3D01P1La8qnog3LjD0QbZ+Qo7vH9jpsAjETyd
   fQ8mv45v2UJNHfVpCPdbB6HAqol1dXPQ+UrDFLnGO4qp1u4y/sQpgId0n
   fQmd46jhzOrBET8R3vHdHXFUXKzFVwbDtmyeYiM5ofP/ZIKIIvxHssDOH
   2TLFmuvfl4BITlW8CtafZEy5ysQ9hWeEmaP36XSX38hAqaEJAL52gaya8
   w==;
X-CSE-ConnectionGUID: 5LeWw9SGQd+z8THYAaMWsw==
X-CSE-MsgGUID: ODwS3P0+RqSs5N/NJw50TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8080653"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8080653"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 05:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="915399074"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="915399074"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 05:51:07 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ruAwL-00000002o6H-0JxC;
	Tue, 09 Apr 2024 15:51:05 +0300
Date: Tue, 9 Apr 2024 15:51:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
Message-ID: <ZhU5uDJk_M_TtKH2@smile.fi.intel.com>
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf73fFHo83gNvDXGy9BosB1MNz_=8kt56hLA12bPBb8CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf73fFHo83gNvDXGy9BosB1MNz_=8kt56hLA12bPBb8CA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 09, 2024 at 11:42:37AM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 9, 2024 at 1:17 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The GPIO_* flag definitions are *almost* duplicated in two files
> > (with unmatches OPEN_SOURCE / OPEN_DRAIN). Moreover, some code relies
> > on one set of definitions while the rest is on the other. Clean up
> > this mess by providing only one source of the definitions to all.
> >
> > Fixes: b424808115cb ("brcm80211: brcmsmac: Move LEDs to GPIO descriptors")
> > Fixes: 5923ea6c2ce6 ("gpio: pass lookup and descriptor flags to request_own")
> > Fixes: fed7026adc7c ("gpiolib: Make use of enum gpio_lookup_flags consistent")
> > Fixes: 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag with active low/high")
> > Fixes: 69d301fdd196 ("gpio: add DT bindings for existing consumer flags")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpiolib-of.c                     |  5 ++---
> >  drivers/gpio/gpiolib.c                        |  8 +++-----
> >  .../broadcom/brcm80211/brcmsmac/led.c         |  2 +-
> >  include/linux/gpio/driver.h                   |  3 +--
> >  include/linux/gpio/machine.h                  | 20 +++++--------------
> >  5 files changed, 12 insertions(+), 26 deletions(-)
> 
> I don't think ./dt-bindings/gpio/gpio.h is the right source of these
> defines for everyone - including non-OF systems. I would prefer the
> ones in include/linux/gpio/machine.h be the upstream source but then
> headers in include/dt-bindings/ cannot include them so my second-best
> suggestion is to rename the ones in include/linux/gpio/machine.h and
> treewide too. In general values from ./dt-bindings/gpio/gpio.h should
> only be used in DTS sources and gpiolib-of code.

Then, please fix that your way. It's quite annoying issue.

-- 
With Best Regards,
Andy Shevchenko


