Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1261F8756
	for <brcm80211@lists.linux.dev>; Fri, 11 Apr 2025 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389456; cv=none; b=k3Tb6tzhZwRCc1sN5fp7QaD/obGuhmAFsMzEHm1wxHncFV34/bod3gvi1IO5RfPROO+ywftjlgi4e4qPeRFncmvIxBOOKDtzI72KU4XSdaDWgv0pXmONF5kwfPu1toGLF4bm7pmr37ws+hCeWj9f5exPAazbND4d9pNkaz4pKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389456; c=relaxed/simple;
	bh=QDqqnNFS8H3+6xvxJhKf4PlhsdEl3XTPqWR+CfGmy6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPyHxbtMe7EcYRlkJsKJEO6WdOnVr1ABFPbNVxlVYJy9RONrBHWeccYGygvv9PYQBb9iORpqIko4L88hYfi2bNaoseFy9ZJV6elW7WpcWaAKtpZt0m1VAP9woZbaVqQBDSgBN7D3mqTR67ydxYI3/NcLXvHolbo/v4ksSTU5k84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksdkuWjD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksdkuWjD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224341bbc1dso22347445ad.3
        for <brcm80211@lists.linux.dev>; Fri, 11 Apr 2025 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744389454; x=1744994254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjzA0YnYKabpFVnU6SCdVYbRaI+R9P9oLUcK7MMUODI=;
        b=ksdkuWjDCc84o4/GNJVyZgf7x9So6YfqwrpdzwlPSBOZcWBxhmNqqx6WhsUQa2BTJH
         DnL2PUHM30yXg3jfGJp3MCswSBgaE9p/R3k0Mp4iyr5949fK9e55a+rhpwjSwbbXNpnc
         vo5N0MRG1UeeXZ7d5rFkwCfYF90L94K+ESKatYI6d3lDnx43CbC8kFtr/apBzdUbaDeg
         oydyNS0VpCpLXaC9Ve7NVEt1mQT8pNpKCSHua2rIJsUqgmEO0gwHowZNQ9deBusOGhZp
         aYMR+/y8ROKt6FJdG8hHba+M2N5A4KE0KA6f0nN/1QcyxwueFh3teRc4L5U0w0yHOE/B
         vbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744389454; x=1744994254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjzA0YnYKabpFVnU6SCdVYbRaI+R9P9oLUcK7MMUODI=;
        b=un340TKsCimfwjHdcPbe9wozZ9cwMxWr1SMuuWs9r+OWdTyAmOakdzSlRL0qkxnwHf
         JNg2m/vdaQs8GlUKbLvXHVsHpfrHSeYbybkMnzA8oSwi+QLaqT3ijLpVRt2JbcZ7z+zu
         f1oV6ENFNcJiL0lEnN/iHuSvinemW3gpkbkCK07HWyNOaVNpNuYPm8sUPu6B8Qh1rIP9
         fL/vMFK+GuINMqdZbDRVAWA7zimJUf7xrLosa/lqjpTE/C3dXs6w1NUAXd4oOSvuTz0X
         8SG9oHAxhJgRXo3ABOW7mbnXSDrnqjhRs9Q5MWCdRWXSjbjmvanXkK2/ils7XZVQbTh+
         Qtjg==
X-Forwarded-Encrypted: i=1; AJvYcCW1umOWm6zsBJTchbrimj+qKhw9IR3lymfMT39f44OfG3GoKesNqgfPUfAIp4DkE4PUm6sfcd826HI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9P/g0Tvb0SjLPNRqTKziKpPaRfAhvDfLot+7bzEkc7dlbJJcj
	Nnlqzqeuimfv6fUbBi13omyvOaPw4l7xX+YCkHHBXXyVzfERuOAi
X-Gm-Gg: ASbGnct7Cm7sKBK5ihowrSQ7P9C9rTej8s2sr74e2r3+KwpMS5aDgbOeQWJQ4cENVxw
	yq6NCt3mKqlBFCahdcRJPpR2DxEnJsbHOO5tJ5/WSd1wvcGftGGcD29wVjYp3/VZTTap4EYfUzP
	2YzYUQPUBmqk71eZ7ReRrNcFd1602QQFnFwGsm8ER7BuPSUQo2J2wsvvuzWOc2aH4THQ2XErGme
	HRayRFvTXjPQNcC4jtrTBRz0ULUT5azjuMR05pavKMWEYHIWGx8zcm6ksznepY4BSTlYb/EGVRO
	+RxjQ3pQXW0stolOZtKTnA9OjPM73sMrMWhnce6PIPTKy2jxtWGOWMSRYkC7Qk3oAoG4
X-Google-Smtp-Source: AGHT+IGlMlFJxwXfO1vN1lbAUVxQSfZJdWvCgXvyYRfzP61vo51gp8lcBZ4/5fk7RALG9+wgB3IUnA==
X-Received: by 2002:a17:902:d4d1:b0:223:42ca:10ef with SMTP id d9443c01a7336-22bea4fee72mr44963195ad.43.1744389454075;
        Fri, 11 Apr 2025 09:37:34 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c971fcsm51537235ad.111.2025.04.11.09.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:37:33 -0700 (PDT)
Date: Sat, 12 Apr 2025 00:37:23 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
	alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
 <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>

On Thu, Apr 10, 2025 at 07:08:58AM +0200, Arend Van Spriel wrote:
> On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
> 
> > On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
> > > 
> > > This is orthogonal to the change to parity_odd() though. More specific
> > > to the new parity_odd() you can now do following as parity_odd()
> > > argument is u64:
> > > 
> > > err = !parity_odd(*(u16 *)p);
> > 
> > Can it though? Need to be careful with alignment with that, I'd think.
> 
> My bad. You are absolutely right.
> 
Then maybe we can still go with:

	err = !parity_odd(p[0] ^ p[1]);

I believe this should still be a fairly safe approach?

Regards,
Kuan-Wei
