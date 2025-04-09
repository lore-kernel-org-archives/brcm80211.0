Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFE15624B
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225014; cv=none; b=d1kCYJ5ZuAgUqfeWMTZ4e4jAeZWRw3n9rQwRCnVksUhwjqQGObkQ4+43qkdrhOHuAJGrj2keVZY2PUP2SeWxcO9FkjHN0l79atuhbUONQ5xyi9596CVAIZRzfTkLSDhuPjeNIxxlyEOih941UVd8vjb2y2+YxwWXKbB23ZSEyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225014; c=relaxed/simple;
	bh=xV0/chfmEtO9SuTIudGBT6j2Ld+A4bRf6t+AlvQT5mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4/gfOs88pVMbVrW+Auwzj8dDB+jL48Y1mh52l2lW45bgTBijhz1wI69//jkoPzg9lgawwF2b6ySdJ3wQEMcywfzbHrSs6+zpNtcGwKnqs0piaOn53ZN4jti+MqySzLB36EwcdTTlJBJcMxLtLPwZ+CA4dzpT6u6ri6qnG1QQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2HQy9fA; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2HQy9fA"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3031354f134so5558412a91.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744225012; x=1744829812; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H44gXeIcAME6+J3Fln1VrlgyA4FgneecNdZbE5MtilQ=;
        b=F2HQy9fAdpL3ky/AFKXWRd0i8brAlzjXF67vKJ+v41f5ZfFWqAMevYuOqeUV2SEBoY
         Ed//XpHCeOvwdTDTnOqEaeNOttKn2yKGuVaevUiY8RTA7pt9F94UFnQhlbR7vkFx9CGE
         QiSkLwlG3sLb4gp910JZZ4vpo1AIFrHc3OdwHp238XDXnXs6zFVtwId6jHMdRUgzC/qF
         7d+UOOHYelW2j2TGsbup7KoxsrTU73Nz2kQ/0pNpksG8EbztcunxvPfa8BIiellkyFrI
         D/YM07+ieuuc7Nz7DrD2/S0OB8d5uCmVfDg2+Q5sucJjqEnc/0rOn2BMS4dcYdgr8HCt
         76ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225012; x=1744829812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H44gXeIcAME6+J3Fln1VrlgyA4FgneecNdZbE5MtilQ=;
        b=FMizFlHrEaUKwZ9cNcIneRk4j7yP9U7xYfDd4CP2dU26J0MBY/a/Sqa+EkPJvYbbsI
         j23KzhpAj4Rj6DLAi1ameP1wwSWs3Vu0nbXxfIkWzh847gMpbP1z9SdreWKNcOV6jeAE
         M4iAGP0/S1gNy+c9r+urF+iN8q8i97DNQIptl9Tx84yO7bsiM3aEaFGfplav9EB/P+A6
         6zcVJy9mb7N5ltBrntNRx+x9ddGESyX9M/K/A6LyxScnMukIBXnnbLkblSRn20VdV4Am
         yW7q9L6cYkcIC9Fwqo5fbXdk0COGec9p9u0vaNtJn66Lh+opRYPbBsKvsUmD0XXX6Nbm
         Kj8A==
X-Forwarded-Encrypted: i=1; AJvYcCWgyd3bF8eOteuGMBV1zrBn2gBH5HjEwVMCDtZUJaJJI+hOYFPe6wHodPsmJzpxZQnVqSHZqB/Lr3M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvH5bvgzS04G/qDj4RfcenIwq85G+7HWEbls3xaiu1bN3SQTZl
	8oGP8xj8w+anhxi8jRUdzaQSjEE5/W8qmq9rB8qZEl4BFp9L+0JT
X-Gm-Gg: ASbGncsu/18XuEkMLo8FPSzOyQaY+RhJNSUsh5rFYwBmRxywmn5m/FDPqbTcVm+cjXH
	lYSD1ggJP3DS1yfJvu9079Ri7KrLgAjbEo56kpGVFtXFvBU0yO74KAN0ULTQchanwaAq5Ej/8C4
	jw0Okq1ZSRnZwl97b/+LbPGBAXpaH/22EzE6kTqvCkEN0N6vnVUH5DukkrHxcDQCIOeX6gvKeLv
	Y85vLKSe74xZZGKPSgRpwCGt/dloXyJDHyuz62fRUPtpWsBZnFCgimU8VVREDN8La4aiHhjxuqM
	0sG4tskV2anhqePp8nMdNJft6PMm/Ueb90Deud9kdlTVoqJEpIdc1jghU3te4fUXtsoJDi2V3h6
	37tI=
X-Google-Smtp-Source: AGHT+IEU+9HbHaJYQfODCw2wi9ncyjloO96dCdgihc1EFdOo4Cq2cGK7FSRZJO7xATXKowJYXeayuQ==
X-Received: by 2002:a17:90b:53c8:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30718b83034mr84933a91.20.1744225011817;
        Wed, 09 Apr 2025 11:56:51 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4d5sm2218595a91.25.2025.04.09.11.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:56:51 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:56:41 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
 <Z_a_PzmNnvC2z7se@yury>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_a_PzmNnvC2z7se@yury>

On Wed, Apr 09, 2025 at 02:41:03PM -0400, Yury Norov wrote:
> On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> > On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > > > Refactor parity calculations to use the standard parity_odd() helper.
> > > > This change eliminates redundant implementations.
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > index 70a4024d461e..5e1b7b1742e4 100644
> > > > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > @@ -5,6 +5,7 @@
> > > >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > > >   */
> > > >  
> > > > +#include <linux/bitops.h>
> > > >  #include <linux/errno.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/ktime.h>
> > > > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> > > >  
> > > >  static u8 calc_parity(u8 val)
> > > >  {
> > > > -	unsigned i;
> > > > -	unsigned tot = 0;
> > > > -
> > > > -	for (i = 0; i < 7; i++)
> > > > -		tot += (val & (1 << i)) ? 1 : 0;
> > > > -	return val | ((tot & 1) ? 0 : 0x80);
> > > > +	return val | (parity_odd(val) ? 0 : 0x80);
> > > 
> > > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > > simplified just to:
> > >         return parity(val) ? 0 : 0x80;
> > > Or I miss something?
> > >
> > If val == 0x01, the return value of calc_parity() will remain 0x01.
> > If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> > be changed to 0x00.
> 
> Sorry, I meant
>         return val ? 0 : 0x80;
> 
> This 'val | (parity_odd(val)' is only false when val == 0, right?
> When val != 0, compiler will return true immediately, not even calling
> parity().
>
I'm still confused.

Maybe you're interpreting the code as:

	(val | parity(val)) ? 0 : 0x80

But what we're trying to do is:

	val | (parity(val) ? 0 : 0x80)

So, for example, if val == 0x06, the return value will be 0x86.
Only returning 0 or 0x80 seems wrong to me.
Or did I misunderstand something?

Regards,
Kuan-Wei

> I think we need a comment from authors.
