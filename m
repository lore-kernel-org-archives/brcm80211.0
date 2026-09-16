Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A53D3B5843
	for <brcm80211@lists.linux.dev>; Wed, 16 Sep 2026 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547315; cv=pass; b=U/zN8pm03LdUvKj/aKtDLcHPvGJnp2VpS8ILvZ7jpBdeMPwrfHY5CJkcJgQbbqFXFUkMvOmkPdI/CpawEAAtd2uNCM8P8jSv3Cdw2lKjoqPvt2m+eTxOKC+kf2Lhk0eFzWGbzT6tYswVIfyxBIMK7jyzytVTkOgjITWDc81cJ+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547315; c=relaxed/simple;
	bh=T9FXw02kbHJEl+ZSBnKkmAGVnRlakuQY/1vtyQfdaEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hq97kBIfb4QGjRcOUgTWLMtpRfznABbNdPBjpwIZKPUBb3pjWXz5oiaXxC+R14oEX0fO+QEhUCbVmXHiS1IblyVU/1ld+xkXZ11bNOEMwjmPWgWgmntdD1V2OCl4WEEByNsRiv09MLm4bIN/eYT2ZAP0sURhAMWqu6uMVYKwZBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hslFkpWG; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hslFkpWG"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e9d8a796aso117998241.0
        for <brcm80211@lists.linux.dev>; Wed, 16 Sep 2026 01:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547310; cv=none;
        d=google.com; s=arc-20260327;
        b=LzNp0jeH/L+OWW6EIxyI5aOeRKvkfOnmbADd8nSSms6m7YvOlBC7xz29bUQsXXh4W0
         Exzl++frhgO51C3MyAs4ehtrr6zD4UUfa3NaQ/asrkJRs1Zq/YL+AZLscjcbBENtDrX0
         iqua1cmUp92F1WB3U5SHGQV+pPG97eurafv/RmqoMAy/HxLdJ98WkBm27IJeqL3fW/aA
         Z4HEncM8O3fBKcZRxpJq8wdf3tkRovg4Bz16z2iBzMCwd0RRHFJrwT9PJX99UF9/hOMn
         glyYnmeUwUMASrM8JVrUYfxibjtXlZWMsKQITY+NDzKIFxilBSuCEq9htrcUEqM/spg0
         /Nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        fh=dBQKMwspq1zuawU0A9jmlL8rFl+hCHeHTbjkvpkzyhM=;
        b=ltKf9vC9Oyrf7NCNBHTewfRCSP+nf3CU4T0PpmBED7V/SO2ETew5TAmQ53nGwnV06F
         oIklOe15lm+Mu9By2AqYh2TL3HNn7ccFbWgM/27Y48/Ri9g5WVSZO0TZu6ZdYv2ZzMiP
         1oBiDv3HT1ycPXOvv7iEpJOm7TQkQfCO4K8AyT86kNX4IKDB20nsktharfaPWbQ816w0
         8fc9F1tQkMKq03iOD3VulOls4Dm9I9+Q+BwQAP+KBFV4B9a217VN+BWV/fEP7jiLnJoi
         NmKUwhZwBdIsAd0f0qViE/n3EvASbjXY5/tzHWLdQtLSjo8nczLpne6JNaHgj/V6kTYr
         XPBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789547310; x=1790152110; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        b=hslFkpWGEVcn+k4sMZSZAN3OnNdLxnRdviewDE6H1s4o7NuMg6x9tQ/4cSHyAYenxm
         SXpBMHr4ainQNlVFEmQpjpjnFq7vYtnymTmnrL+7JsO4ZBvz94bFLJwtFiyF722rgjIb
         gajdGFGEDUl8Z5FXjdo5Ql6u8CeXCaiGUAIOhsrGd+zbBZoK3WB3i1xqlb48E+Cw+5yw
         THkGftl6OekM4WPzGiB0RoWRK1Y9XE+c5qdBi29cx6y1vCnY31z7R9xtzf47peDm+e50
         yMGN5eu1aR51gPpgURVAaTM0AnvFuAt9KEoFyaIGY8+48KNN78sFzmftk7J4eqVAdS+z
         upug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547310; x=1790152110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        b=BDw32/rLxERsB+BagA4disar+WYgH4yW6iMMOsBtgWHDUL4RN0KHINMgx3AljHGWjb
         jT2kJxQBtjaIi6b/Ma+SL0t33/ICATxM1fTxHx54J4Ek3F3fSqRM2cemAURcT/J6Sdb8
         NFiRFrpjmyGG5Zk+fJaLnA/JxfRYT7WBUnDAIiq6/Zgdy1syyyZ7138ngPe59LD2Mz2a
         FF+Rpa5uXqe1WPTOYDAsl/VBTxiSxF4/0qrHzSmY4vRtQ0HCFPVfJgFfctVFMhmAYPiK
         A+nXp4y4e90bAJazrD+piFCMtcsj1gTI6A61S1HFGUKPNnRsr7iNtaW9uX34lFSAL+g/
         VOPw==
X-Forwarded-Encrypted: i=1; AKwUvBxaHdRAPsO4i+MzyTABQapVHCFgGRatAyDHC9ITuc2FT1BZuJe9O4EsLy0tjUQrA3Z7/NYr03x55p4=@lists.linux.dev
X-Gm-Message-State: AFuF++lOfbVelUAw+LdYSKDYFnDC0f4grCWZFEuFD90FGLblomRQ8Zns
	+mNTLZwjOxZ1nadeI7PAlvMRE1NrM4TxWjICLlQTupVKVOLYlUrAkWcQ2F7+N2Y1tkt4LR8ExwA
	M+NAxt9ihUKAsiG3KaVW52EUmm4zi4JaoyW1/4aA=
X-Gm-Gg: AYBFou1Qs2C8wPJFBzZv+dOGuIfTokfv48vq+YABKYCl03lBMa5kFqljMITD8uV/V1e
	HxBWPYPQenONRYlAOy0R3MFdPyouwfH4k5nbdtXLUqDhw/YBe9E1uXzRRu8sebxlEPLGVL6sJvq
	roF5vL3e0dq0OAIRbHqAWWSPHH1xVzNPap4ZdmsFa1wUnbb0wOPEonpUhuU5KRxMR7IG73mh8vy
	2NZYHKrp1Qohr3k6fcY8wf3ycFoeo81WKbnmHXW3pjVFakFJ9zQOh4jxsAaUpeU7Ctm7dza5gBO
	4moHJeQZsRAc+G7OmpGlgXpL/d36BoDQ/c7rkOh6Bkfbu4SCBS3r9GXurkioI4GSZlvStTQU0uB
	aOtZ8DS5VzkBz/hTw6Rwa
X-Received: by 2002:a05:6102:3712:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-7a0522a8290mr540435137.6.1789547309631; Wed, 16 Sep 2026
 01:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-4-morbo@google.com>
 <202609151155.CC22827@keescook>
In-Reply-To: <202609151155.CC22827@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 01:28:13 -0700
X-Gm-Features: AcwNN1W06HBvxyPAyDNMWJbd-pZRzg8rOuNuZoGljznF0BEtCKl9YZ-3dIsOV-o
Message-ID: <CAGG=3QU2LxKLdqTOHse4U9AZ3sGAUe-C_wbDnBq4W1ncdsPVwg@mail.gmail.com>
Subject: Re: [PATCH 03/28] ARM: atags: Replace strlcat() with snprintf() for
 cmdline extend
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, codemender-patching+linux@google.com, 
	Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

On Tue, Sep 15, 2026 at 12:00=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Tue, Sep 15, 2026 at 08:18:20AM +0000, Bill Wendling wrote:
> > --- a/arch/arm/kernel/atags_parse.c
> > +++ b/arch/arm/kernel/atags_parse.c
> > @@ -121,9 +121,10 @@ __tagtable(ATAG_REVISION, parse_tag_revision);
> >  static int __init parse_tag_cmdline(const struct tag *tag)
> >  {
> >  #if defined(CONFIG_CMDLINE_EXTEND)
> > -     strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
> > -     strlcat(default_command_line, tag->u.cmdline.cmdline,
> > -             COMMAND_LINE_SIZE);
> > +     size_t len =3D strlen(default_command_line);
> > +
> > +     snprintf(default_command_line + len, COMMAND_LINE_SIZE - len,
> > +              " %s", tag->u.cmdline.cmdline);
> >  #elif defined(CONFIG_CMDLINE_FORCE)
> >       pr_warn("Ignoring tag cmdline (using the default kernel command l=
ine)\n");
> >  #else
>
> It's pretty clear we have a pattern of "simple append" that is needed,
> and while strlcat() does that, it's horrible. I feel like we need an
> appending scnprintf(), and it needs to return like strscpy() does (i.e.
> -E2BIG on truncation).
>
> My goal would be:
>
> - don't open-code string length math
> - never leave the destination unterminated
> - allow for format strings
> - yes/no return indication for "did this truncate?"
>
> Initializing a whole seq_buf struct for these small cases is too much
> overhead...
>
> For both cases (small without seq_buf, large with seq_buf), it is also
> frequently needed to know the resulting strlen. seq_buf doesn't do this
> right today, and a strscpy-style return value also doesn't tell us. :(
>
Something like "llvm::Twine" would work well for this.

-bw
