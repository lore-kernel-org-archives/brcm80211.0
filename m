Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24217B4FA
	for <brcm80211@lists.linux.dev>; Fri, 21 Jun 2024 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718999041; cv=none; b=Uvh4KopvJOFBrOEZyo6KoUFIRxta/2A5ATbsoqNagLDDSY9+q2GncTev+UanTQ3LgvGuE5mnAU+Gx9tz0z7hmVAju3Ry63RJVcmUBcsQ8G/gIRdUnpxIFpHdp+au6pY9CA+zO8a7UL5Hfp1oavEp6HorZ+yShRZGTL8tTv/hThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718999041; c=relaxed/simple;
	bh=FckWlNcKkH86nEpWwvTUlItzowssczEyxh04y6cUrQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROpCRtYrPyhH5W9sVtGGMz2QWV98K2cyh6QY2jCdTuQe0wvq/pT+gAq0H2ND6DN2VdVZGUA+ksA9146BcSDhYWIH5aapE3nOYSpOgO8kpciUKi2fjoQu5NjyvvtHgk2464BywfIhYMLi0O+AO+K1/jg+V4IyXpu9UNjLvsiFr14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZEOZFKQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZEOZFKQ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-71871d5e087so305317a12.1
        for <brcm80211@lists.linux.dev>; Fri, 21 Jun 2024 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718999039; x=1719603839; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkIb7gf2bHPY6dWL00bChK5hdPR/pt0YWtKvdJeMO1w=;
        b=IZEOZFKQF3Z9J2ke+MfoB+6Nw6fVwNaGUtvwB0CspqL+3kBMfpLDiBXOsngMyo9RUu
         n+KSolsDFRO5ezEWI6eI2qSLQXM9BmH/fI4FtKOr5NTo+hgOdcl/9lvJJhH2UUxQrGCC
         elpqxDNqo1JSmMFcsI4QHD/AWiLH9u3Rd2KZ2UpLDOZ133MWY8I3WKgKphkB4d+avaRa
         +ih+aSk/W1fbdiaGWJSxBMWmQ11ctefCj4xonanu+W60dG3L7U9UzPWeXto7AmAgwsrM
         +J8GxiPDnpmkvTdyqc3FSDM/dpNFL4RLilc6ZhRMsHey/as39pyqCx/slLVDTLaobhl2
         MJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718999039; x=1719603839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkIb7gf2bHPY6dWL00bChK5hdPR/pt0YWtKvdJeMO1w=;
        b=v8gnfsYTtDbkIGRkafOUDxxOh0snIWpWuARwz2CtpErWWCqiMQOhL//zKsdj7vsbIW
         OamssN754cO/eUvx7Z3jf5YcUQDRVAVJVd/NDcKFH9l5xXKPGFUA/yMwZSMxqCGgwru4
         F87bdSXKTM5t+DS4ZEBMNpMDuNRdzy+9XuPJfi/xfudsBpklbG3y2M8qZ9dfH6b9d7Fd
         SPQtSOPpuzpe/E5rJA3BpMwj9Zb7zxd4xdXpYCMoOfk4SB0gx3QMk2J9IOAZlVGZ887a
         5pxieQ2GIrzTPJM13rDJ8Zagsf0FfyvNtZ8F3oxHz43kSJRhgAwlVKYIhrWQXHMtjHcq
         D0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUIpLXJU2Eth3k5IvLZL1oXooGH9OccTKn+SbyA59ztf+r0ISjG9yM7LjVB2mODoeuV6tdk9t+EAvtFuocOxQVNIsy801y8dELq
X-Gm-Message-State: AOJu0YysCvfjm99qUUIsHVAACHZdtx4nhTYHjwVjstxPmwcQcOlNj6gv
	SH0v9HGdgTneNkgUt4wUSAF5kg6cOMgHL1a3YQVVxrXFdgz/iiDVfMKSJAnBoa6ESxcGb2ywvVH
	6JbXoZ51u4QwNg0QydNVd/IdZP+A=
X-Google-Smtp-Source: AGHT+IG/VHNVGO8lR86yTQZFauMxfnJ6vv1yrqpGRdYmFybn/jp3wU2ZU3njC7MVpJ6AVq5rCdQRmUr7DWOzhI/1Isk=
X-Received: by 2002:a17:90a:4a17:b0:2c8:893:2c1b with SMTP id
 98e67ed59e1d1-2c808932c47mr4517482a91.21.1718999039034; Fri, 21 Jun 2024
 12:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617122609.349582-1-arend.vanspriel@broadcom.com> <1903bdacb28.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1903bdacb28.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Fri, 21 Jun 2024 14:43:47 -0500
Message-ID: <CAG17S_MPxPms32e=s8szVOBHQk=tikN5sjO_pa8r1as0V2Q5ZA@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmsmac: advertise MFP_CAPABLE to enable WPA3
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 12:32=E2=80=AFPM Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On June 17, 2024 2:26:25 PM Arend van Spriel <arend.vanspriel@broadcom.co=
m>
> wrote:
>
> > After being asked about support for WPA3 for BCM43224 chipset it
> > was found that all it takes is setting the MFP_CAPABLE flag and
> > mac80211 will take care of all that is needed [1].
> >
> > [1]
> > https://lore.kernel.org/linux-wireless/20200526155909.5807-2-Larry.Fing=
er@lwfinger.net/
>
> Tested-by: Reijer Boekhoff <reijerboekhoff@protonmail.com>
> > Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> > ---
> > drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c | 1 +
> > 1 file changed, 1 insertion(+)
>
I think I get what it is supposed to do, but am unsure of how to do it.

the modules referred to in that link (b43 or ieee80211) do not appear
to be loaded:
# lsmod | grep 802
8021q                  49152  0
garp                   49152  1 8021q
nf_conntrack          180224  1 nf_nat
cfg80211             1032192  1 brcmfmac
rfkill                 49152  7 bluetooth,cfg80211

How do I set this up to work on RPiOS?

Regards,

Keith
