Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9606D1D7
	for <brcm80211@lists.linux.dev>; Tue, 16 Apr 2024 14:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713276317; cv=none; b=IGAfRlbJKZMO6VPYXgl20Q/S0SKsuFPKWmqQHD0LExyTlgC9k2x8f/7H1o8tSlWGTShNFfKwDxZsmNsi9mGMjYVukHWpX6d2Rz/lsxxoEkPlD7MBDRdfRfAiMPYOMwwJl8hTVVOXabz9j2Tk/6rbHA2sxvm3yjCYJMyErd5xNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713276317; c=relaxed/simple;
	bh=8M2ppSPVva638z5ABaUVriqyvbuS97xgMtG6yxPRPDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdQax1IdkX5syaIGD5xBgJAQ8r5veI9uJn+goR6uYrpIj2zAVIZ0YXGne/r2AViYJLkGWattP4UHiY1tw8t0yB/ryGlqRwvySEkk4tToAaDC5kXYW5xnLBj3U1qzKWdeWekAAeIEGEKHQyK96QTQkDxS1k0CGQiX/iGa5v0ImvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCPP+nqj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCPP+nqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713276313; x=1744812313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8M2ppSPVva638z5ABaUVriqyvbuS97xgMtG6yxPRPDU=;
  b=nCPP+nqjWbQv9n8x2pTfI4ce03WHxE8thdI/EW4x8ilPne58vekR1nMi
   bZI0Wpj2hqBGiJ8O/NrPXtKTUd+St+MubmKbSTWCUY1fHnczkzz2+FNFs
   tHy8YI1S09nskq15ANqE+gGAo97Y/EGzaBZAJfaLleARNqL9GIdw4+rK9
   wMpEmrPP+u8TUpL3mqrHvEIlmaAxw67ryUp77xrgTP9JSW7Qq7BcJyqt+
   7vccE98Sf3wKs3QwFvEEhz5kiJBWXvK6T/CFfiQe4TIu4MzCtVfQflgYs
   lyJciEChL95fnGLB/r+dBT/Jh/UUhQWF4C2B8CWIQ8OUwjIRiR3wURmTR
   A==;
X-CSE-ConnectionGUID: 2DD5jb6oRuWaT7aQwqHjIQ==
X-CSE-MsgGUID: 7znLcZOXQmSlRoARE5ERWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12554251"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="12554251"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:05:13 -0700
X-CSE-ConnectionGUID: Osep5OIWR6yhlH0nyEsqwg==
X-CSE-MsgGUID: 5BAvzasNR0WOGHBLZR1yMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22340887"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:05:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rwjQo-00000004iLg-1Y7q;
	Tue, 16 Apr 2024 17:05:06 +0300
Date: Tue, 16 Apr 2024 17:05:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <Zh6FkejXcwBTAqIR@smile.fi.intel.com>
References: <20240408231727.396452-1-andriy.shevchenko@linux.intel.com>
 <20240408231727.396452-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdYaXVvtt3b9rFxU4ZNShD17Bm4XU9X3h4dY501iJy3kPA@mail.gmail.com>
 <ZhlSaFWlbE6OS7om@smile.fi.intel.com>
 <CAMRc=Me489H-mTfT1hfUsY47iKwoaVsf6sgkiBwBVkxJOBo9UA@mail.gmail.com>
 <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZRp-DFQgb3=Ut27DHd1w11_aEY0HbLjJHob=C5Ek-dyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 16, 2024 at 02:22:09PM +0200, Linus Walleij wrote:
> On Fri, Apr 12, 2024 at 9:44 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > IIUC include/dt-bindings/ headers should only be used by DT sources
> > and code that parses the OF properties.
> 
> That's what I have come to understand as well.
> 
> I wonder if there is something that can be done to enforce it?
> 
> Ideally the code that parses OF properties should have to
> opt in to get access to the <dt-bindings/*> namespace.

Whatever you, guys, come up with as a solution, can it be fixed sooner than later?
I mean, I would appreciate if somebody got it done for v6.9-rcX/v6.10-rc1 so we don't
need to look into this again.

-- 
With Best Regards,
Andy Shevchenko


