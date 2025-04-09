Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA491DAC81
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 18:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223002; cv=none; b=ph4kfbWOWpLB76vp8553x6nicVPjbFvlBAmWJnC3x2AwEZn1qI0vZF2R8/fdXh4sFUawPJkPoAhSTqiFMmARdGbMlhjK5lKuNxi6olghxRSkd+riyLvlDdLFmD5WJ2vVmU9UuMJF6dl8p4CDlbnP+s33CDAYkGRixhpZYAcQu+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223002; c=relaxed/simple;
	bh=Y9V6lanhSq3xKkI3cq5cXSbzBJnJbbBkpk0mUILhY3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKqn0m4UmgMaHmgRuXyMipNEp4b2PDxCUxML6+LH28lEdbmPjTaWz9sU+0Ju8GqozrWxkNYgg8Ol/i4h4TrjrcCzFobHabUsnHhvw67ewDzMfp3HerQSfXB78vly9KKZfPnz2qot6KyigKts2YydUYS4A63gDCoSAcqoqehc5Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PY8PzlY9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PY8PzlY9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225477548e1so69600685ad.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223000; x=1744827800; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYzoH1Uwhcqg2+qDINtEMV7dZsf/NWh1BI5tm3o/1uQ=;
        b=PY8PzlY9ANc1em/QXdZSjiFz4RSnB/mF3b3hnc1Qd2fvmZGQENTGGKYp1UIEA4b87C
         GJk5Il6k5GIMPfxE+h+iu2Ql/XjVQdQiTmH7xw27ddZxmHHj4zLbZzJ6CC9+xfWaXGXd
         zdTco4AWQi1NXXAHlQ0llY5OfdhO+jShjUu/lLZJ4AChyQFCDNy5UTDyfbnkcvfr7v64
         9jIFsLh1qcFGeC9+TW+mJP4GoEMu8+nVSNZOCw8UGXOipqHiN6SI2iW1+rObarAzoxnd
         jX7o9Yvm5oD3TzpNSKJQhn+ZtXt/dOs0CDt1nWjIJlqwfKGdO5Lri7prscU8epOHN2Bu
         Xfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223000; x=1744827800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYzoH1Uwhcqg2+qDINtEMV7dZsf/NWh1BI5tm3o/1uQ=;
        b=nImZRV2z2jKlQOdOTFDzE9zxM+uOvVEoayktoLCc6dO4SzHTzMsK1UcZrPL+wQzEcx
         WgxuO4cLtEac3FogJWN9NlMJUjtumeGRTiFpfBzvJ07TnGSx3hoI58FiAkTSUecdjah+
         bBxlRstyqP37WPx/PMoTB3Zqushp6ykMwbfEvIIn9BS1y9xg0dsImo/GKUXcsS0+ikqP
         9eMAamYruJK/5YwDcnrfKnJaShQpbK3UJB2xfAYm5tb+ltwMzN9e2b5A6XXpZLyFHJeu
         rmC/qCbYed8nGawRjPSRFQZ5NRLmxEpQXnh0V9xTONn/1XvxV7k+za0oeGFrdKC7f+zl
         CS8A==
X-Forwarded-Encrypted: i=1; AJvYcCVsnqYsCLW/8SbxNtAfxZV2IpmMnTVb8X8a1dIJtsgGNuiimUBtKNZHJX98p91DhIHuS0OWaj4/jGg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjnriojLp0jkOlYGCBfTIwIDH4iqUe103wuqf4iTFbOi+w0Zgg
	8Zo27leRx9fBmmbfAYy+k6o3qcMI2Fq1F9mgJh+OPUJ4a/tpCzlY
X-Gm-Gg: ASbGncs2EKLfvuTqfgaHjypO0cYdLU2BZbUKeCN2GQvoS8YUyfSEFbd7MoOfZTY9yhN
	FHev8AMBW0NK/mAYgYx1bItxtqYQAH0gBe88/STCkeYT5aoJbGOl4Ow9tIokzmSwTdNuJ2QsNaF
	BVymHOo3NB42O81exJ1inQuGy7n7lE1wE5IMcKZSr8MBIbyOI8v+3Zk+c6xxhcU8x9GTvG4/KE/
	XXjSCtk55Q/tWDLbWBwJL+sHfThSrTtwz1/GI5JgbOUwihOBzHo53lUjbc7g8Gh3QCxH+KIoSb0
	gcRRMXr3OG4PZBiMWtMy1PHJB20T+VR5N66XFlsEZbJIJyHW/7BeB/H5PF4KBwcj5O7+
X-Google-Smtp-Source: AGHT+IFJTXcO6iff2D3m6F14Oejj60CpisJRfAo2/LdtyKFQF1rTvBeD9sWDrAGl2dH2tL/2lZXd/A==
X-Received: by 2002:a17:903:2441:b0:223:2361:e855 with SMTP id d9443c01a7336-22ac2a1aefemr59522875ad.39.1744223000437;
        Wed, 09 Apr 2025 11:23:20 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e6b8ebsm1679194b3a.180.2025.04.09.11.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:23:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:23:09 +0800
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
Message-ID: <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_aobrK3t7zdwZRK@yury>

On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > index 70a4024d461e..5e1b7b1742e4 100644
> > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > @@ -5,6 +5,7 @@
> >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> >   */
> >  
> > +#include <linux/bitops.h>
> >  #include <linux/errno.h>
> >  #include <linux/kernel.h>
> >  #include <linux/ktime.h>
> > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> >  
> >  static u8 calc_parity(u8 val)
> >  {
> > -	unsigned i;
> > -	unsigned tot = 0;
> > -
> > -	for (i = 0; i < 7; i++)
> > -		tot += (val & (1 << i)) ? 1 : 0;
> > -	return val | ((tot & 1) ? 0 : 0x80);
> > +	return val | (parity_odd(val) ? 0 : 0x80);
> 
> So, if val == 0 than parity_odd(val) is also 0, and this can be
> simplified just to:
>         return parity(val) ? 0 : 0x80;
> Or I miss something?
>
If val == 0x01, the return value of calc_parity() will remain 0x01.
If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
be changed to 0x00.

Regards,
Kuan-Wei

> >  }
> >  
> >  static void vivid_vbi_gen_set_time_of_day(u8 *packet)
> > -- 
> > 2.34.1
