Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6372040A4
	for <brcm80211@lists.linux.dev>; Fri, 14 Mar 2025 19:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741979174; cv=none; b=TgrEHHiwqqSZiJYfsbZMUozsbrDeEvAN9Enk2IojrSVu+JjnC/Vdrn4R/ZHJwAG5vImvYrpbStE15dG1ZnXEAnBo5Vlf2eSQl5JXMJdPM8WCTRDGhoZrDi5OolujFHJR0Xg1FHn6+YHZixwwpuWw91D9qHyk+zgk77R3ktqeZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741979174; c=relaxed/simple;
	bh=ajFs9F0tAspFsaI2EHxXJ0ngkqO/JuYLnCLOEmhLTss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3GG2qKdlro5hEExXi4euScqjyxE2U4da6jrQI8yjR3Co76uaJ1Nn0w0t9Nm8OSw8YjKzywLo1ARtzS5fxxLfbEt25NrtuEqjRDu+X4pYNzVB6gM2BbGSCde0RRMDeGEz7gKC9H1tVG3ztE8a8o31wvPGFiI10pTiTACXtO4ncg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqWLRGzg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqWLRGzg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394036c0efso280455e9.2
        for <brcm80211@lists.linux.dev>; Fri, 14 Mar 2025 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741979170; x=1742583970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIoPbweeHXZ8jSMzIt/eB2E0Gri/NMU0G6vQgDoXF0o=;
        b=GqWLRGzgpqm27ImwsTEr3DYxwNnCY/RG33LTOmgbXhJ2HpY6e6iFrc4yB5eej4Cyta
         oS6E9PUFmkKH/94u5h1HjS21X2zwxU/x5gsnVg1obpSZ/XoCmJVWPDIRJbls6UK/syhD
         f7ox8ezBo6vP1r7KZBi17X53WG8QvKwfNtYV6pmNVVCfrz7P9qfQp3iUVeZkP29KVNnF
         wfCnZTTRmMt12/JO7Uv8UgvGZ2vJbFKy3peUy9NlgWlhMMLcsf+7VJ6vvs9Gz2ralf5x
         CbgGvajbYK0tBqNSmxwE4Z0VXJWydKPlCQa2ptbSMPXEknyrov1zPAcVSTzX0gq5Odcn
         U26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741979170; x=1742583970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIoPbweeHXZ8jSMzIt/eB2E0Gri/NMU0G6vQgDoXF0o=;
        b=CDaT49iibKLWAmC6AmKi1c85GV+YCMWtJHw3DBmwPl6QmxonD7WMiztKNmukHRPUI3
         a5vgVYuBhnVQFChnzsA77H7ZdCSgXbuvZaSuMmkHlLBnIeYn24rmcW1hP8zJr4fIeSVh
         C2VAa9tTTIz2ufehafXoqTENv+CXne4DIbHOaO5WvbacJ1HnCvsHTyVFay3I2KTky2Uv
         3YGIkSgPlHUALc5dDVjDqMsBvJwzjoVBUnE4QE5Al1CvBp3tW4nwYqdGZ8dT4XmUNinD
         s8LXHebZozhUojygYs82DciRQgKM7LDDb8vUc67wkTd3uYc2041En1RpRgGTIZnPewIM
         6PpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8UvFqFlbbLgnDAB2rcrzRZ3auWCie+JeW9NMPjwVjNxkVjPW6IkZh9IhneD5s5Pz89FmbC+AVg1E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1ca6otEyikKB7EJuV9iniHZTK4Zt73xK7DwHs4y32rX7BwOXm
	M+0ykJIzmh5ypmkalMdoZuutZUGRFJ9/qJHAg+cuJxjhlg4E2/Fa
X-Gm-Gg: ASbGnctgp9HPaaHIP2SJ4bGKrKacNUZS+dLX23x1EhGmOG8s909/y61/G+lWXRuirMX
	iX7TFnko/vTPtfxJmFKT/FguMLLGsMU+L6r7BR5/RHZwRy+TXjDAKrHGUwEtBbYOtv2386E1VwD
	j1bax0LXFamHz5zHrE/2El384wilfdUnjW0WOh2D78Y3VdLRA59YsE0iXDYCioZPQHGHft3Dega
	6pvH8zHDwYn4Y19Za7bHwREXELX/i8b5c5ot4vqn+fKbB3qKd1Tx7Ou0+c0BZolYlJbem0VxWZM
	FcsfJKOoSYBit7U611Oa5J1rGKbXmUHhVmFOuI5Ryihbl1yr0mJ5gbH7mRJB5p6BPCVMa9e2xH1
	bA9hEj1w=
X-Google-Smtp-Source: AGHT+IEjEm1NLGYF77AUJiqADkJJt9c0HAwrROWKW9ldaOHP/gE/432Db9RpHAyqooeI7TNtApdt1Q==
X-Received: by 2002:a05:600c:4447:b0:43c:eea9:f45a with SMTP id 5b1f17b1804b1-43d1ec646demr47176475e9.4.1741979169941;
        Fri, 14 Mar 2025 12:06:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fae32sm25534355e9.31.2025.03.14.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:06:09 -0700 (PDT)
Date: Fri, 14 Mar 2025 19:06:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>, Kuan-Wei
 Chiu <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
 <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>,
 <awalls@md.metrocast.net>, <hverkuil@xs4all.nl>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <edumazet@google.com>, <pabeni@redhat.com>,
 <parthiban.veerasooran@microchip.com>, <arend.vanspriel@broadcom.com>,
 <johannes@sipsolutions.net>, <gregkh@linuxfoundation.org>,
 <akpm@linux-foundation.org>, <alistair@popple.id.au>,
 <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>,
 <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <oss-drivers@corigine.com>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
 <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>,
 <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250314190604.53470966@pumpkin>
In-Reply-To: <b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
	<20250306162541.2633025-2-visitorckw@gmail.com>
	<9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
	<Z8ra0s9uRoS35brb@gmail.com>
	<a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
	<20250307193643.28065d2d@pumpkin>
	<cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
	<0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
	<Z9MGxknjluvbX19w@thinkpad>
	<795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com>
	<b2b632cc-ca69-497f-9cf9-782bd02cac79@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Mar 2025 14:09:24 -0700
Jacob Keller <jacob.e.keller@intel.com> wrote:

> On 3/13/2025 9:36 AM, H. Peter Anvin wrote:
> > On March 13, 2025 9:24:38 AM PDT, Yury Norov <yury.norov@gmail.com> wrote:  
> >> On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:  
> >>> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:  
> >>
> >> [...]
> >>  
> >>>> This is really a question of whether you expect odd or even parity as
> >>>> the "true" value. I think that would depend on context, and we may not
> >>>> reach a good consensus.
> >>>>
> >>>> I do agree that my brain would jump to "true is even, false is odd".
> >>>> However, I also agree returning the value as 0 for even and 1 for odd
> >>>> kind of made sense before, and updating this to be a bool and then
> >>>> requiring to switch all the callers is a bit obnoxious...  
> >>>
> >>> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.  
> >>
> >> The x86 implementation will be "popcnt(val) & 1", right? So if we
> >> choose to go with odd == false, we'll have to add an extra negation.
> >> So because it's a purely conventional thing, let's just pick a simpler
> >> one?
> >>
> >> Compiler's builtin parity() returns 1 for odd.
> >>
> >> Thanks,
> >> Yury  
> > 
> > The x86 implementation, no, but there will be plenty of others having that exact definition.  
> 
> Makes sense to stick with that existing convention then. Enough to
> convince me.

There is the possibility that the compiler will treat the builtin as having
an 'int' result without the constraint of it being zero or one.
In which case the conversion to bool will be a compare.
This doesn't happen on x86-64 (gcc or clang) - but who knows elsewhere.

For x86 popcnt(val) & 1 is best (except for parity8) but requires a non-archaic cpu.
(Probably Nehelem or K10 or later - includes Sandy bridge and all the 'earth movers'.)
Since performance isn't critical the generic C code is actually ok.
(The 'parity' flag bit is only set on the low 8 bits.)

	David


