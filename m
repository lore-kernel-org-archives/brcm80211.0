Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08282D9EDC
	for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776458838; cv=pass; b=R4+8otLFHRxLKLKSsIgNTO4jj02R2StzIG/qpT9Z07eN0w9cfnjUyO5hJ7nlYOO+NIWYAlWNWjdRmGc+LXISvoufhF1p4I8onc77yX3X+O+0vwVT60A4XW0GfwzAARedBzRybwKcR1CYw0zZ37twhVkX/Pul0qs+w5poG42R9Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776458838; c=relaxed/simple;
	bh=fkLn4MUAb/1CdcaVVBNrvFmjlYd3Xzh5v+4UhL/ncyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzlFRBi48PLeeRBe0qJ6FlmGmi1XePu8sqc3OBmjSegxegS8qSsmmtrEahZW61J4SlwDJR59gQajQCKO17L9tmlpN5z4sFMAp5MnumVu3K1k1nRxGmkqm0W0t/eNDKHEsj1t3O8ZhIp4HTl4lYv9ol8wIg8Ig78wOYbbIWpzWhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpInHvSZ; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpInHvSZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba3b9601b97so170029066b.2
        for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 13:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776458835; cv=none;
        d=google.com; s=arc-20240605;
        b=bjHb9ExPvDB3EyoMWrRdOHhzVAUsxRwBxPerelqin0VbogxlHUHOqWZp5dzczWt53S
         i2uJM5iQibmusru660gJ+8j3u+IRiyh7PPlqNhPg4qSVDA6EwiAdFfYNYNqVpFaIg6Yj
         1cmkoAZckHmgX2PygSZnq7ttCkH/5tcTeLOnd0kEdV2r7CBDRGf1bzTotZ+NackhAX5Z
         1bwRSCQfaqssZChToGq4rPQ8gnkB0jLisOJ01KyMC6cyPWZ9oHGlSuhYNKgjP7gYDtxl
         VDSphO/aIXH+zt4bm4Aa03W7iog01+kBg+O61VwOsacHniZCgtiZgapkoXzemmMvOmdf
         w18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/YDtpkD+GmNdsxlX7i3/rbUlU6XEg9qRnletGPADEbY=;
        fh=FMYkageZDBOzNw9xDkBQ2zNhysHeFGe+LBbKsiuGsE4=;
        b=UT8JJBBaJNvtJwnpf3+BKPVBr6XFqyACWdDodn92w4DMEzpo1f3Kfj1MbHmekfLwW3
         qpxcBLXWuHPH3OoFvuhILMwqR5a79KRkleDMLy5rTcnQSOA6sKPDnJ7B37AimrN+yFFp
         XohwD/8ja/Hm/roULYoEerYKxAK65h95HVEqkxZMFlUkkVDlWR/ulsm/1MaFGC38HmLd
         aVnRozZMKdFSL8o/ECybBU7eE6dqJboSyrNnPhPwmuH+fZL8Q1rnc/7IipffwIYX0/tF
         XAYNMa8nWXC3Vpta2zB2eiU/uyAPAP2WoACgX9HQpZUD6q4MH90WF/2XRcldHoxTTWQ9
         OJ8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776458835; x=1777063635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YDtpkD+GmNdsxlX7i3/rbUlU6XEg9qRnletGPADEbY=;
        b=QpInHvSZxLj7q1f9RvCR3eyb+KeuLB7Mqg/V9+n92OUwnWcZWlsGyvTq+dQHFi6g9q
         iPCfHQnzUySLsfqNvESheaPz2m5X2g2IPCpiWCne0b5Wtl2DWPkqwXA2AKYAhs5gNW+t
         r43sjdmzwAY7MJxjuvSDIXXIy24cblK1OiflBoJn1nj9v0pk20CbSD4AiAAgNv/xQev9
         R/2JBolwe9u4JR0eBgOLyMbhcyZu4bxCGrOJKi7B4t19l6aBnB7G4WN1scQ9uM7wyQfi
         aSN0q4tJ9spUGWzP+TjyVmT5lrWk7OUjbe838OgWSrHju/eD3sePTX475j+1DY0wxq1S
         kb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776458835; x=1777063635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YDtpkD+GmNdsxlX7i3/rbUlU6XEg9qRnletGPADEbY=;
        b=VxS30COVaNPxnm2NptAwxfNT5PUvR4NqBWhAVYxvFKFoOllhalwk06h7xlnUV/CIIJ
         KM/fN/HL3DIPV452S8gBH8AJIRp2i9Beokom18jiFz+RkLvXYr56mLV8qOYVlVxfCCxu
         yVNcYKYBdxg9+g9BkM1yspf6Ex0WPMEhQSqz5HXGw/hoD2v+uElPYy2ZW53DOcnkfuax
         /fP93Go/TisOj1ug26Xb3gCbRQV5Sq2aK4i74efvVcVtKAwKYKwZ7MQXmSEyakwuJcsH
         aI0fJyENGaqs/cHQFfpTLPqqYGv0/w6J5N4RcRFWqcfTIhsyy6nIJCPX7kajcqbtPAXT
         jaIg==
X-Forwarded-Encrypted: i=1; AFNElJ9O01Ng4t4M30NsB3li6yF4dbcv6VmmthcaPDGMsZvvDCmhJLeoP+dIsscT5A5eGBh+YrBbaVtMxuo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLFGzwfTe4lUtw39ZDUN4vWwAxhA/yS7x78mqcJJgu0fwy6DhN
	NrdfgXBtYDBLov5wu8m81inqFNllDuzet0xIhD2y95KBufdpZO02RsMTEcsuAWUV8nj3TXnC/8d
	Mr5nSz5rPeJSE+bSfx2Th9Ld/WvZ1n6OHplDW
X-Gm-Gg: AeBDiesA9HHxVQchB1s8hnqDRizMHnrK7IEmH+pTyobd+SS7eKcpDUlTSuwYV+jUlSk
	+FMzaZ+N0/fYSzKVHKA5IwQwh4PCsqzpAkCSH+pirYYZ+j/wCGEdCf+WB21Gn7EIhEr9l8E5zf+
	Cr+AkHHZAZroB29jFt+cszPaQeeaSkK9QyBiPL4KH5HdCWlVAq2EB7R5Oc0iJPy0Kxm45ermTI8
	0LupfGuLUtlHiJgasBQDgFifVaiaXUoX8tmzy5UTGYRcZzpHHiCYYm2utJpUq6HrCRnBValHBIb
	KVoAzQYpVFwzqyowr6BQP16TBVLu9l1VBZ96r6xRLPHM8Y4HLNE7P7ZjJrUawO4W8orAZ0YiQD6
	mu5KD8ZnLIQomZyOa
X-Received: by 2002:a17:907:3d02:b0:ba4:8ecb:7d69 with SMTP id
 a640c23a62f3a-ba48ecb824amr199874966b.13.1776458834892; Fri, 17 Apr 2026
 13:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331233238.23527-1-rosenp@gmail.com> <a612564e-7338-430a-b7d8-8276adb45b05@broadcom.com>
In-Reply-To: <a612564e-7338-430a-b7d8-8276adb45b05@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 17 Apr 2026 13:47:03 -0700
X-Gm-Features: AQROBzCNC8Wra5fJSWY11x4yLjA-7doLAGoTcu93dmmZhzp8sgQDeMKM48XVbyc
Message-ID: <CAKxU2N8yEfv0RG9Owb0W8PtmbDSzYunxUJzQo0v8Gvbw2PCBgA@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: brcm80211: change current_bss to a FAM
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, 
	"open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS" <brcm80211@lists.linux.dev>, 
	"open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS" <brcm80211-dev-list.pdl@broadcom.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 12:15=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 01/04/2026 01:32, Rosen Penev wrote:
> > Change to a single allocation with kzalloc_flex and remove some
> > boilerplate.
> >
> > Done as a FAM instead of value to keep -> usage in codebase.
>
> I get it and it looks a bit like a trick, but....
Used in many places in the kernel:

git grep kzalloc_flex | grep ,\ 1 | wc -l
33
git grep struct_size | grep 1\) | wc -l
99
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   .../broadcom/brcm80211/brcmsmac/main.c        | 32 ++----------------=
-
> >   .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
> >   2 files changed, 3 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/=
drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
> > index c7eaf160e1fa..4f57d64b1dd3 100644
> > --- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
> > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
> > @@ -418,21 +418,12 @@ static int brcms_chspec_bw(u16 chanspec)
> >       return BRCMS_10_MHZ;
> >   }
> >
> > -static void brcms_c_bsscfg_mfree(struct brcms_bss_cfg *cfg)
> > -{
> > -     if (cfg =3D=3D NULL)
> > -             return;
> > -
> > -     kfree(cfg->current_bss);
> > -     kfree(cfg);
> > -}
> > -
>
> ... it does clearly give some code reduction.
>
> >   static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
> >   {
> >       if (wlc =3D=3D NULL)
> >               return;
> >
> > -     brcms_c_bsscfg_mfree(wlc->bsscfg);
> > +     kfree(wlc->bsscfg);
> >       kfree(wlc->pub);
> >       kfree(wlc->modulecb);
> >       kfree(wlc->default_bss);
>
> [...]
>
> > @@ -527,7 +499,7 @@ brcms_c_attach_malloc(uint unit, uint *err, uint de=
vid)
> >               goto fail;
> >       }
> >
> > -     wlc->bsscfg =3D brcms_c_bsscfg_malloc(unit);
> > +     wlc->bsscfg =3D kzalloc_flex(*wlc->bsscfg, current_bss, 1, GFP_AT=
OMIC);
> >       if (wlc->bsscfg =3D=3D NULL) {
> >               *err =3D 1011;
> >               goto fail;
> > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/=
drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
> > index b7ca0d9891c4..e9cbb95a5a17 100644
> > --- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
> > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
> > @@ -614,7 +614,7 @@ struct brcms_bss_cfg {
> >       u8 SSID_len;
> >       u8 SSID[IEEE80211_MAX_SSID_LEN];
> >       u8 BSSID[ETH_ALEN];
> > -     struct brcms_bss_info *current_bss;
> > +     struct brcms_bss_info current_bss[];
>
> It does feel icky to use a flex array for 1:1 object relation. It seems
> the lifetime of both objects is exactly the same so I would consider
> using the value instead of FAM. It would give the same code reduction,
> but making the patch slightly larger.
>
> main.c: kfree(cfg->current_bss);
> main.c: cfg->current_bss =3D kzalloc_obj(*cfg->current_bss, GFP_ATOMIC);
> main.c: if (cfg->current_bss =3D=3D NULL)
> main.c:                 wlc->bsscfg->current_bss->chanspec =3D chanspec;
> main.c:         rs =3D &wlc->bsscfg->current_bss->rateset;
> main.c:                 mcsset_bss =3D wlc->bsscfg->current_bss;
> main.c:         bi =3D wlc->bsscfg->current_bss->beacon_period << 10;
>
> So it is used in just 4 places not counting the first 3 hits for obvious
> reasons. Not too much effort to use value here so please do that.
Sure. Will send when the merge window opens.
>
> Regards,
> Arend
