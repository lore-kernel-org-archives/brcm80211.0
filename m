Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F94A498E
	for <brcm80211@lists.linux.dev>; Wed, 16 Sep 2026 21:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595075; cv=pass; b=EmqVyHReytOy7Mk4FVsoznsz5hTstR2VJ/g8Y/jVtJwIKYjhypuN74xokwBAnVTH0d+R8R3n+XzyPGdfjq7U3YLWh7Hkgcy/pNV0De4unoirWs4DqFo/L+aDw4Hu0SKGVzQ84hw0ESWfkt/ovEUuOxj0zon5yDRbKt4pmAtuu4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595075; c=relaxed/simple;
	bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbbHeT+/J7J2nYnylXzJtFiEmr5dIs83SUndIvgZgcs1Vnsmwgv4/4tkGjMlkQT4UKwJyVsHyvi864wzEmbLOwBuX/diMmv5SQqUA43VMt6r07xegrPz+IHFIasxJF6WHqX72A2QWYQwt5mdxcGlIDGpcMLEnOqhksEBQCSUkZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iWpLMWup; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iWpLMWup"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso48146241.2
        for <brcm80211@lists.linux.dev>; Wed, 16 Sep 2026 14:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595057; cv=none;
        d=google.com; s=arc-20260327;
        b=ilH9RCYBBKMJN8rCtY34AfL0h1O+w6lH7s34tg3Ks49HedtMlvYUR6OagcoObDiXbw
         TGQxdmZBe0wtReYDtOfWluuKxkOLPGzszfzNjiJVLU6IShEmIsRIoMdbIgjt7e3pI9y2
         MyZ9Ytynqbc9JdjXOaJF4GxXdgMU8i12T0o9TaPJMMMlIBzPocRgsYImLhuOcoLvb+kA
         ZrRXCSXZHBkpGeV87cGAmAiSgZwxLLhBBldKvtOFHLZSFRsCOxYoSn7bKbn521ZBfVHg
         zE10SqsxV9vqN+qJ0x9VkpELFjxz+w6i81s2wdL1i0KYKu474nzGAtYJjnL1P+flJ4cJ
         973Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        fh=HwY3ZoMJ6esIaPA4Twg3JHRD9gxcWVE4jRWJK21kzyA=;
        b=bJXxllDpaOYGDMdHdFr57lt/xgWRsQ+sm4Wzj4jZVMtEuTNrbntUH93bwLdBIJoL0b
         yCjz7tOtAy5kP7bqZTp0x4DKEA5jCC44sNa+oIu/UoewEHz8ghDwZS6iKVkcWRNNF8sx
         a+i0BKV0NGW2Vr2dWxZGil0Dah3EUFEb2U9QSpceb6rW5Zr4XQARMvNNSeYDCIXhorAh
         vzaGCsjhXgKY/RFnviP2KLJQzHDBeog36vgo7WdGIlo+hQOhqSW1k60N8eqwtJ+kRYlO
         xYlxlvKq2NGjne47i9Mf/U2+rOHqyR7M/0RqP9gPuKlm6NARQ8l23Vug8ci9hUUFwh0a
         wqVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789595057; x=1790199857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        b=iWpLMWupYJ/DHhX0qDMyIzfKZssJ0dLfJRXwHGOEHVNqJJIQrVcOTFu3LC1Sfxh9t7
         +bdU6XG6L2kpsvneGiQ9sSDXstNRr/7wz1MPT4wIPuBmz1Uc9Ct13ZutZSagRfc73OAa
         EexuSKA3bvCbyGfXESfZ2SfYpYgM2ZCmxYPZMYbsb2gBTbibDF/YBfoQXjFeZe03d4uo
         aUgiGV1divl1QZZl0BWBvuB+mUTQS6oNQCpmDIrx6rp1C7CjubsyH5kIUDYhetiyTEfM
         gn9gFIvjNzVVgHF4sgbJWWqsgWCPwxJJVgchtOAgyaiTnt5jNpzPOEM8VPpeDVKer+ID
         zOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595057; x=1790199857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TMWi8xF1c/GpLGSJWBDMGttEHh102/5Ofx0+5TAWdU=;
        b=vfM8DzEZbUdaHVTL0kXo1iflNl1ouuoIgTsGPs/fixBgq/ihWbRkN8FZdCM1tw32KK
         RoG36aRWtjCCHqYF53Dn+FglUf5I2MQhyVIUXkDQuDimtp2i18dpbz+zC0I7iSiFkaBh
         OHleVR+5+cK1A2zqI43St956YZQfucKBQ7RrKwurHpEkdGt4anwNh6JKle8ZZzXMl3mN
         1VBwjQjzbuxw9C6ruFUhYHPBjWPLO21WHK1gl5IxDI6lDB2hkT894BQc+bNB965gqnrL
         AdCLj4G3AtcIGkyw9udntEvFV/z3f4pTpj/7miB+JchLQbeJVsXUmISOU7nhQ8qtEchz
         jd8g==
X-Forwarded-Encrypted: i=1; AKwUvBwVcKrnlq3+tmQoXF0NbE/WQYdTt3iup063SPAji6wpvAHUfDXFus89R84PyfQy27tf8w5vEihGSx4=@lists.linux.dev
X-Gm-Message-State: AFuF++k6bz9CW+5sPH9bcPfsNgdsd2msMW0CgbKeK/IGjlM3nKdF8cmT
	GZPbl6uH/ULxPDuzOFJ1k89Xs0D/MvImHemKCY1tDS4NVp9Q1gIbqo+2LxS4fbBiZTt9ENsluFC
	BF6d29tg9OTck1q/IA7tLF7spC8lPPe3DFQd0Aig=
X-Gm-Gg: AYBFou3A3zueJ9abUkV7TrXJwH13tlGoBhpGMCqAbPFJw4oS6GwoOwJIBqkhJcPFakR
	5PJYUfI97R3GR2qR41mW9pvllyT0FZVSKKIIYh9mHhJ3dIKQlva9kH/e3pP7tLbazJW3X+Jscox
	IL0oFPC4i4m7/KWjZkmtIJj5c6ly86qt7H/tLpmC9BAkuP30SJe8mHEvfSaO5T3RCXzbUcPipTM
	lfnlmY8/xK0E/UV9mpSGFqYYdkC2u2H4+doi+BsD/0A6WMWdyQKdRfOqH/drt6upOlDpIVjtCpa
	YadQs+rvVMllDZcgXpifuQJ+WzCPZPE6bOrpQ10Y23ZwCBJxTexgHq4mgCah4yF2ChenvQ31n1z
	nudmuIUTb12tNrCGIYpr6
X-Received: by 2002:a05:6102:a85:b0:7a2:2a6b:e7b4 with SMTP id
 ada2fe7eead31-7a22a6be8efmr62586137.2.1789595055938; Wed, 16 Sep 2026
 14:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-26-morbo@google.com>
 <202609151258.5FC01072@keescook> <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
In-Reply-To: <20260916010945.GEaqnsWSZ-DTMyTO25@fat_crate.local>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 14:43:59 -0700
X-Gm-Features: AcwNN1XbboPOY3deKY79Gty15vkSErYIT9HTgeQdVXaDzFhBvm8_kiOA449bIqU
Message-ID: <CAGG=3QVZRCJ94+DOfSsSDhsrXVYf-ec01NZBy299nYiCAYfXKg@mail.gmail.com>
Subject: Re: [PATCH 25/28] EDAC/thunderx: Replace strlcat() with seq_buf
To: Borislav Petkov <bp@alien8.de>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	codemender-patching+linux@google.com, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Luck <tony.luck@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Jiri Pirko <jiri@resnulli.us>, 
	Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Thorsten Blum <blum@kernel.org>, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Cryolitia PukNgae <cryolitia@uniontech.com>, Jiaming Zhang <r772577952@gmail.com>, 
	Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	=?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Rong Zhang <i@rong.moe>, Arun Raghavan <arunr@valvesoftware.com>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-edac@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-nfs@vger.kernel.org, devel@lists.orangefs.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:11=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Sep 15, 2026 at 01:00:00PM -0700, Kees Cook wrote:
> > Seems like seq_buf would be better her? But yes, at the very least, thi=
s
> > needs to be scnprintf, not snprintf (or add the checks as you have
> > here).
> >
> > The rest of the seq_buf conversions look right.
>
> This driver has been an orphan for a while now (we just made it official)=
 so
> I'd prefer it if we don't do anything here.
>
I'll remove those changes from future emails.

> And yes, that mega CC list is just gross.
>
Apologies. :-(

-bw
