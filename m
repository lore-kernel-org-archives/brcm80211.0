Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A66620E6FD
	for <brcm80211@lists.linux.dev>; Wed, 12 Feb 2025 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739369626; cv=none; b=tUsNZXAgKK7X7TbjPiizaXx3p0+fFyy19pn1CF+uDL/kCdghb4+UM6zF4vBT0DzgNsiJMqfupT/39Y7vVs4+muQzzTAq+fQA7M170YbNfzXaOCpjFHvHsWFy+7GbxtFFu6a3jlRVmAtMugUABwVuOuVnVBrSLzaYtqGjer/zMo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739369626; c=relaxed/simple;
	bh=AoDJc0eFSn9Ie4M9/s+34j/oPjJgTPUCXo4qVdKoFzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSE3O+prNrdws1BSY1i8V/Ct3U6fcyhijTqjKrLsw/Z4wGmP4D8lmfwJy1WdsejmUVpLGDJimzruCyNGD/mvUMCLQ0VMZmzwI8c3roDv/6aLeuDaCyKcTsOTc5Sh5RYuTHCBEoKcBvOtxIFL43i/HptsuPZA5FdFjtS7PNBJgA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csvtVyhg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csvtVyhg"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fa48404207so8236992a91.1
        for <brcm80211@lists.linux.dev>; Wed, 12 Feb 2025 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739369624; x=1739974424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/J0ukjrssvswYnWbZg0nxjQDyU78VHg5GA1qLkUFJs=;
        b=csvtVyhgoh92i7gIp/ooG+Nv+14+h2nyzOapk0X/wqSh0KS9vCtxDNXFDLqyfmDgXH
         2yBenK3IgpH6sJfBSSkSKwLJsmf+Ijx+mtfEWEwBZYDFW3UBowRx8/o0wWMpJ7WVNTYe
         ep1qXWy/l2FbEHiJcJv+k1rKyQzwkCX4cTsYkXoTZxxnP72a6oYGEJ/w8M2FcBujnRf+
         FmW7hdXOXucuNeh0j6SyFvA2igmgzyTURNFHjcvPCAzBfE3fa8CsxUqM0IjEf2lgpk5S
         4FObfxBidy24iIgidFYnwIUhWr34iI1KqAFd8xZuzClMr3cMWC6teNZ9Q62veK15bgZv
         WcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739369624; x=1739974424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/J0ukjrssvswYnWbZg0nxjQDyU78VHg5GA1qLkUFJs=;
        b=VHU1LuEVliYMHILdovfp0edZmzLegK70qFzft4aUMtFBh8bkFZKYXA3u8NY3stDRPN
         j3i/fPrEvQ5vx7jM9MErJgwU+klsPpll2AbnmeQ0FxkmgIjk1Yq9kUw1PG7E6qZEV7Wm
         DynC1URrZnt0uhm0KQ4554PHRBGdeV4YSJBBYtlWhNPwQ0RMvjTPudhjEm5Mz4Am9blW
         /3mF8jEUIAyncJ5wni1AjC6Cyf7QX0wSZnpC9KzckXVgzmdo6/XkxKK3Qq/ds7wZKCVN
         F8ZYkUl/Y6FzH3v35MrBwEbedAXIm1AH/6ka44GdKc+11z9hNhd+b8WSbn0LtXcd+4GO
         TOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs+Wy/cTXtbTiIGVNkUHhQSXQ7La7i2omFywnj0oIXtrgffzalxWSeHQTksMeju7xG2MeXkXypziA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrAp/vS4S75GkY5EIExk6NCRrQv/fUK3GF5BivPGN4+MtKEBg3
	1C5rAZBSH/Jd6IpnMCLAEDjkh5I8ukE99g+5sGWIi3q2Jjzlo24mvmCK1rTod9RNcN5aVLDOQF0
	HdZaP2YafB6HhrKtZI7OezShnaSq1Kn7wE8s=
X-Gm-Gg: ASbGncvnfDTaWFbYdIauyfkFCNpf28c9mNj31wWF7piEVYy4z/Aqz+JDvpFlCL3HsAn
	4YYX7IVeKUOeIh2ZFh1fHh8DlYjLoT2wy3N5cfXZ0WOTNa2hX2yuLQah5qsv4X0lQAXxh8CUECx
	8=
X-Google-Smtp-Source: AGHT+IGHKWuaIUcnrWZTSCAhYuwgR/nInOGvyQlh+L+51q379WiI0FMRvivcXZnkDttZUotoPjr+43EipFk1ZUULU4g=
X-Received: by 2002:a17:90b:2742:b0:2f4:4003:f3ea with SMTP id
 98e67ed59e1d1-2fbf5c6ac92mr6112169a91.33.1739369624396; Wed, 12 Feb 2025
 06:13:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
 <20241215120401.238320-1-arend.vanspriel@broadcom.com> <69874369-495c-4698-af1f-502d21371f7d@gmail.com>
In-Reply-To: <69874369-495c-4698-af1f-502d21371f7d@gmail.com>
From: KeithG <ys3al35l@gmail.com>
Date: Wed, 12 Feb 2025 08:13:33 -0600
X-Gm-Features: AWEUYZkzEjccYMYwzzLcO2FBGvhFrX2zYVIui-PZVIvFkrmKhSII9tI3Tz4lvYM
Message-ID: <CAG17S_Oh7mjecrSju=CxfB5eSqTGewY5gUYqK3YC-oW4jW5G7g@mail.gmail.com>
Subject: Re: [RFT] brcmfmac: Fix structure size for WPA3 external SAE
To: James Prestwood <prestwoj@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, Ting-Ying Li <tingying.li@cypress.com>, 
	Ting-Ying Li <tingying.li@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 7:42=E2=80=AFAM James Prestwood <prestwoj@gmail.com=
> wrote:
>
> Hi Arend,
>
> On 12/15/24 4:04 AM, Arend van Spriel wrote:
> > From: Ting-Ying Li <tingying.li@cypress.com>
> >
> > Add pmkid parameter in "brcmf_auth_req_status_le" structure to
> > align the buffer size defined in firmware "wl_auth_req_status"
> > structure.
> >
> > Signed-off-by: Ting-Ying Li <tingying.li@infineon.com>
> > [arend: adapted path to apply to per-vendor variant]
> > Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> > ---
> >   .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h    | 1 =
+
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_=
types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
> > index 18129adb5dc2..1cbe66526d82 100644
> > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
> > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
> > @@ -54,6 +54,7 @@ struct brcmf_auth_req_status_le {
> >       u8 peer_mac[ETH_ALEN];
> >       __le32 ssid_len;
> >       u8 ssid[IEEE80211_MAX_SSID_LEN];
> > +     u8 pmkid[WLAN_PMKID_LEN];
> >   };
> >
> >   /**
> >
> > base-commit: 1cac3bd863bef434d43e6b0554ac5d7f7f6350fe
> > prerequisite-patch-id: d5b3eb93d54bd6a0508a91f4627ec3e59a810928
> > prerequisite-patch-id: 653281e1349a038c7f48b3513243f3211fffab9e
> > prerequisite-patch-id: 0e47ab711ef159237e20c860834d3ac269b05eb2
>
> I've tested this and can also confirm it does fix external auth on
> brcmfmac. I adapted it to work with the upstream 6.6 raspi kernel and
> had no issues using IWD + external auth to connect to a WPA3 network. Is
> this something that can be upstreamed?
>
> This is the firmware I'm using (no changes to the default raspi distro):
>
> Firmware: BCM4345/6 wl0: Aug 29 2023 01:47:08 version 7.45.265 (28bca26
> CY) FWID 01-b677b91b
>
> Thanks,
>
> James
>
James,

It is easy to do, but I am starting to get confused. Is this in
addition to or instead of the patch you posted:
[RFC] netdev: avoid PMKSA for fullmac drivers
Does it invalidate the need for using the latest cypress/infineon firmware:
Firmware: BCM4345/6 wl0: Oct 28 2024 23:27:00 version 7.45.286
(be70ab3 CY) FWID 01-95efe7fa

If we can go to a default kernel and the 7.45.265 firmware, and still
have wpa3, that would simplify things and make us happier.

Keith
