Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53FE572
	for <brcm80211@lists.linux.dev>; Wed, 17 Apr 2024 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343549; cv=none; b=VnF4xPVuBH2OHjKQMzMK+k7iE7jXzBP7KTl2hWx0PTa8yoCmDlULknFpPGe/fsa6OhScZnq8L8C57Ia+2X8zO2lejc2f12jYN4pU8gI7Sgvud7cOMidoVPmgyuVpsnaFNWS0Co8tdCpaY1sBEgBVl+iata1zyy8MP67Yf1NONQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343549; c=relaxed/simple;
	bh=DGDR1TQ4GEjxmU4I2WPT0qXg9Na4g1DIFeR8IF/YkD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a24zuUOzSgRlbsH3puNtsPnBxlX9DjNdFT2To3q2Q+N8kgWafTR9l8SWWXnTpni/uxGXf+1/XnQ6FsS0c+JSi+nO7lHgE0s2DwOZBxjbbSy3+tGwHCherwnsTpwM5zssU6WBotqkzBvZ+eX+oJSRuluoI9KnOFiFVBHf/uLmj0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhGeig84; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhGeig84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713343548; x=1744879548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DGDR1TQ4GEjxmU4I2WPT0qXg9Na4g1DIFeR8IF/YkD0=;
  b=GhGeig84DsTiVdutiwJ+Ewn6IamIo84eBp2eY9pYIwPdxTrWxE4FrZ8y
   C4u0ToVbIdt6YW4vUrpOw7rGNxXxvqQJg3FfERJNI/5+PfFoN3EJK7URl
   p8jFSeRyQPbP5mLXTsE8kc0SMFUCoYuDuV3PMDUPhVDhWwhTagfGMybIP
   EnvBeUuwdwhml2QYcdpNCv3g3JpW4Ec7RdBKVF6fljUDasX1zUAihj37f
   7jfF71gorbzNem3l8zxq5b8e8rnNO32+cKwMz3R1vf81P7AOWd1hPWq6E
   5IcT8mGCf3fqV5/pHADunkIVtHsa8vfDssa455+peYptT5iTbhYOE1qcd
   A==;
X-CSE-ConnectionGUID: Frv/Z05SRp2kR/R2Rch2og==
X-CSE-MsgGUID: rcJ/CtBGT/Ozfn7nbm9seg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9042934"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="9042934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:45:46 -0700
X-CSE-ConnectionGUID: ECKDBFvHTOS9kjeT29b6JQ==
X-CSE-MsgGUID: VqHYRbHcT+eYQVnX3Br7UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="53520463"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:45:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rx0vA-00000004y1K-2EOo;
	Wed, 17 Apr 2024 11:45:36 +0300
Date: Wed, 17 Apr 2024 11:45:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] gpiolib: Fix a mess with the GPIO_* flags
Message-ID: <Zh-MMAjf6hhNOCpL@smile.fi.intel.com>
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com>
 <ZhlSaFWlbE6OS7om@smile.fi.intel.com>
 <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
 <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com>
 <Zh6FkejXcwBTAqIR@smile.fi.intel.com>
 <CAMRc=MeXV4_MT5_DKYtHqO+324dFJnr+Y1UtR9w9mj-y2OOqAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeXV4_MT5_DKYtHqO+324dFJnr+Y1UtR9w9mj-y2OOqAw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 16, 2024 at 11:07:58PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 16, 2024 at 4:05 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Apr 16, 2024 at 02:22:09PM +0200, Linus Walleij wrote:
> > > On Fri, Apr 12, 2024 at 9:44 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > > IIUC include/dt-bindings/ headers should only be used by DT sources
> > > > and code that parses the OF properties.
> > >
> > > That's what I have come to understand as well.
> > >
> > > I wonder if there is something that can be done to enforce it?
> > >
> > > Ideally the code that parses OF properties should have to
> > > opt in to get access to the <dt-bindings/*> namespace.
> >
> > Whatever you, guys, come up with as a solution, can it be fixed sooner than later?
> > I mean, I would appreciate if somebody got it done for v6.9-rcX/v6.10-rc1 so we don't
> > need to look into this again.
> 
> I'm not sure you got what I was saying. I don't think this can be
> fixed quickly. This is just another bunch of technical debt that will
> have to be addressed carefully on a case-by-case basis and run through
> autobuilders in all possible configurations.
> 
> This type of include-related issues is always brittle and will lead to
> build failures if we don't consider our moves.

I proposed a quick fix which was rejected. I think this is still doable in a
few steps:

- align constant values in DT and enum
- drop usage of DT in the kernel code (That's what you want IIUC, however
  I disagree with this from technical perspective as DT constants can be used
  in the code as long as they are mapped 1:1 to what code does. That's current
  state of affairs. OTOH semantically this may be an issue.)
- restore enum usage treewide (?)

Again, the problem now is only in open source / open drain configurations
and there are only a few users of these flags _in kernel_. I do not see
why it can not be done in one or two evenings time range.

P.S>
Most of the time I spent when prepared the proposed fix is digging the history
and trying to understand how comes that we have desynchronisation of the values
over the time. The output of that is the list of Fixes tags.

-- 
With Best Regards,
Andy Shevchenko


