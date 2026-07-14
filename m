Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CB448C408
	for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042039; cv=pass; b=riBMs0a47NmujQSAzJuUGUco1GMWC8LMzVYmbiaXhs5vw3gVpLnRl+gZSLigtpE9WwtDkpngHROHApynLSqwP41fGt2ihb7wmUGH3Sk7lEA6lyzCxRFG4NyJQwMbbgoGAmX15FGMKtG1NSC1q39r/WP4gtIAu/dLTMCxmMibd0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042039; c=relaxed/simple;
	bh=UgoS0j4K78MlIyl1+UAw3ILDHgBghJ5jb/4dajKUK1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQcqdy+ExWfsmHDc108s9wEX+tnOiJFL/b0abfFr2HsiKWmj2AnUb0rQkdHgLTiBY7mWkADl0Jssl086bqw414TwQd3eOUMjupvm01biuviGd4MYd2w67P6AcK/QlYGhim8bcng2qSiYKaQWdfrpPSe8C5KKc2hjl8NtDWcSvJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1z/iqzq; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1z/iqzq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceeee8c46bso2341545ad.2
        for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 08:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784042037; cv=none;
        d=google.com; s=arc-20260327;
        b=pxsJYoynhi/ZI3Naemj3JxP6NGMRS2+z7AKSHD4xvU2nPxo3RrspATj+t2EXTKOeia
         8dOnRhP0E/Q8MK+glseiGJ7KlvclGtaEYO7IvDL5GxshyaPbPvXTX5QTUahkZUxAQmE6
         BA/2UooOen32DVoo0KhFiTbIv7pbhRl9aaaqhwZduEaMilTDurt1EXhE7AEPbbkhIYEe
         pvb6iJ8iQaWJEny+5CrLVcYLC25sNgdkMj6rLPiCTv9mdzINJYucusLUHs07zG2qTs30
         l4fwwfhMEiqVlwcyp/YaZEMB5tGMIOe2+QQXcezx/cvlc/BcyUjSnu1iEbyLzAcD/KGu
         Pf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vK5QmwsUTvO+w3mfeVvzuue37ffn3bjmkO1DFTx2Qa4=;
        fh=XiSSvdOgS5KbbocGJd0kZ+8bp4ioXK0h65W/oejFSuc=;
        b=TJd/VG5OAiCaXqj0Y0Dh4KRGVnemKCZVVw/qRp7IJQQxzy/y0Q4+Sl4tnyg/D7efv6
         D8IIKlxsx2z5LzkXrXqSa9isJhuWK4k4ATEPUxAoSuALlEwWm5DBLBfEtO84BZaxyI2f
         8s0NNvN1RpGnYDWs8I++ZPa7LVhCWaiJiqWcRzLd6evD7ACK48voIPMCUFuiHSbq8M7e
         RsN8UGDrFv1tn3M9drUzmTdDtjTUpPpuVoklZjWNGMJ/j8NSz8TJOrIDyb2ovVsG9yEB
         9ipP7tXC/mb9GdL/zrCi7yADmjRlY+jokz+U0ScLoFRBzyxhQy6TUMMgGf8q1E5mbHBq
         4qIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784042037; x=1784646837; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK5QmwsUTvO+w3mfeVvzuue37ffn3bjmkO1DFTx2Qa4=;
        b=h1z/iqzqrLWtaS/i1mvKDyi9RDaPxECbc6yZ0lBoYmUrZ3Uqjo0vhXLRrU7uoVBrEn
         hZ6d2Q4Y2/yITSyCUtjtnll8s0R0ffVwhsEBhRjC2u/r35RaS3OELQUAajEErgV14npm
         m/YoXwpY7XnPQl4lay3YfR4HzuF2h6r3MxciGY49KwHBTWMt7ShRN4ALoHe8I7o7MUSz
         0YePAkibj72pM/OVOXwaGToKSWHAI7qUu+2OETEbA2JDxXmwz0Hj8q5FQNJzw1jIbxCr
         FWoV0UQ9gMNbAsiJF0QTTRZeIdPPJn9Y0tIWywzpIi2S0gAQyWduIDecI9geGAbiFxiz
         uXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042037; x=1784646837;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK5QmwsUTvO+w3mfeVvzuue37ffn3bjmkO1DFTx2Qa4=;
        b=C9K1YTU4GfBy8MbAFAJRNO7JA8B32qt6XLfv/jIeB6BdLClGhOnarRhJooQyVUivlL
         81bZy9qwjff31OuCcTfp7sYm2JXiENP5VeJgg/KpirMaz6WwRhBZvfZHlJ1sjpW1L4y0
         nANslDew0qEY/Mt3TViGvvinoveEzsqBLGr4H/eNu+df9Vlp0KHFGtWPUfqzeJdisVQh
         72/dYmuEso5Bw5xiBKG26KJAE5UWCkGSu46JhkGwwYSeDn/vAJ+KR4XDxPBfL9Yxe4W8
         9ZGXKAAAkb8ljDUkm05IJX5a6kYqNMlUCFeZiluPKa80hlyjysUEjTyP4gqpOwadF8Ub
         QC3g==
X-Forwarded-Encrypted: i=1; AHgh+RpVdtqitGd0R5uHGqAKm6lwOaQqMwoQAWu2w0GCwGVtYPeScxL7rzHWwj1Uy/XufhRwtr+ssTjWa/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YztQtkCU5EEHeZH3cTHTRVrLQFz9IolFtwCJ9ba0u/Jy1RpacwS
	nxB9P9ZUg5TlUt4Wb8fwahgfh6bEZTxFziXxpPGmSgD6WoMGAkUT3nnb6mjkdHCe1t5pLu7JVsL
	IE7mmp131FliTXuhaxjCGaMmIRTRyOro=
X-Gm-Gg: AfdE7cn3at4Ci431LE0NoRys6q2Rx4BfK1dpP4/koFUYzeuSjRw+j8zoEvs0DBmhzzx
	EiHNo4aD06RJrBcv8KndyYKNcy1T5acyV2mSqfww1Gz8PXP0PgnJNAod0SHhSe474SaAA6rbyG4
	mQxEUHVD63xd7djZ+mOZEQz7Qd8vkzHo/9KtouoLMJFu3fJ8/+nqFB+oyigbE1/I/SOsIzxhoQO
	T6ycfTyD/NFvjtpLsH7SIgHF6SUOOoQR8nCk3epegR9pvumYY2nHI4m7UTk412Y7InIJAJ+Vgrx
	pFSd1/zrYiBV9FJgRa64/TLlT9hbfj/BuSxL/OzEQeZC6I9bp51JSrStJCN7mXcQbC0lpnA=
X-Received: by 2002:a17:902:c40f:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2ce9e59ee7cmr124563185ad.2.1784042036663; Tue, 14 Jul 2026
 08:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709122315.11400-1-bogdan.nicolae@gmail.com>
 <99c2c345-c594-46e1-b48a-de7f6e52e1c6@broadcom.com> <CA+ORkNTNytDi56RJbWHoFXLR2mSAgosz4UxHPgEvCBojmaFOdw@mail.gmail.com>
 <cnztilpxknxuyofx2pfdqissbhqtopwoygzr73ux2qmyasqebv@iesg7d6rvxsw>
In-Reply-To: <cnztilpxknxuyofx2pfdqissbhqtopwoygzr73ux2qmyasqebv@iesg7d6rvxsw>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Tue, 14 Jul 2026 10:13:27 -0500
X-Gm-Features: AUfX_mxGWHBpBRJQmPI31ArrZDWfrMpuuVcSaRw4MGfRobcdoK48Ob8bRnS2z2c
Message-ID: <CA+ORkNQ40+xO2+aOc302Z9OZ4qcaWXRE7J-xOR51=-k91prdgQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, Bogdan Nicolae <bogdan.nicolae@acm.org>, 
	wlan-kernel-dev-list@infineon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 8:03=E2=80=AFAM Gokul Sivakumar
<gokulkumar.sivakumar@infineon.com> wrote:
>
> On 07/14, Bogdan Nicolae wrote:
> > Hi Arend,
> >
> > The code already sets *cookie=3D0 in the beginning, which according to
> > my understanding tells the driver it does not require async tracking
> > upstream. This is correct, because the function calls
> > wait_for_completion_timeout, so mgmt tx completes by the time we exit
> > the function and doesn't need to be tracked upstream. However, while
> > we are waiting for mgmt tx to finish, the firmware may generate
> > non-matching completion events captured by notify_mgmt_tx_status.
> > That's why setting a non-zero packed_id (sent to and returned by
> > firmware as part of a completion event) and checking against
> > vif->mgmt_tx_id is important.
>
> Avoid top-posting. Need to use interleaved style.
> https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
>
> > Cheers,
> > Bogdan
> >
> > On Sun, Jul 12, 2026 at 5:30=E2=80=AFPM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> > >
> > > On 09/07/2026 14:23, Bogdan Nicolae wrote:
> > > > Avoid setting packet_id to cookie, which is always 0. Instead, use =
an
> > > > increasing atomic counter. Avoids mismatches of completion events l=
ater
> > > > in brcmf_notify_mgmt_tx_status, where packet_id !=3D vif->mgmt_tx_i=
d is
> > > > checked.
> > > >
> > > > Also, zero out auth_status on initialization. Otherwise, garbage wi=
ll
> > > > leak from the stack to the firmware (when bssid is less than 32 byt=
es
>
> BSSID will always be less than 32, you must have meant to say "ssid" here
> instead of "bssid". Also the auth_req_status struct does not have any "bs=
sid"
> member, it only has an "ssid" struct member. Need to fix in commit messag=
e.

Fixed

> > > > and/or when params->pmkid is set). Then, pass the params->pmkid to =
the
> > > > firmware (without it, the firmware caches a garbage PMKID on succes=
sful
> > > > authentication and denies a subsequent association request that inc=
ludes
> > > > the PMKID).
> > > >
> > > > Signed-off-by: Bogdan Nicolae <bogdan.nicolae@acm.org>
> > >
> > > I always get a bit confused when people use different email addresses=
 to
> > > send and sign-off patches.
> > >    > ---
> > > >   .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c   | 8 +++=
+++--
> > > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/c=
ore.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > > > index ce09d44fa..cca53ff19 100644
> > > > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > > > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > > > @@ -23,6 +23,8 @@
> > > >   #define MGMT_AUTH_FRAME_DWELL_TIME  4000
> > > >   #define MGMT_AUTH_FRAME_WAIT_TIME   (MGMT_AUTH_FRAME_DWELL_TIME +=
 100)
> > > >
> > > > +static atomic_t brcmf_cyw_mgmt_tx_id =3D ATOMIC_INIT(0);
> > > > +
> > > >   static int brcmf_cyw_set_sae_pwd(struct brcmf_if *ifp,
> > > >                                struct cfg80211_crypto_settings *cry=
pto)
> > > >   {
> > > > @@ -155,7 +157,7 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, stru=
ct wireless_dev *wdev,
> > > >
> > > >       memcpy(&mf_params->da[0], &mgmt->da[0], ETH_ALEN);
> > > >       memcpy(&mf_params->bssid[0], &mgmt->bssid[0], ETH_ALEN);
> > > > -     mf_params->packet_id =3D cpu_to_le32(*cookie);
> > > > +     mf_params->packet_id =3D cpu_to_le32(atomic_inc_return(&brcmf=
_cyw_mgmt_tx_id));
> > >
> > > As I understand things the cookie value here is an output parameter. =
The
> > > driver should assign it:
> > >
> > > +       *cookie =3D atomic_inc_return(&brcmf_cyw_mgmt_tx_id);
> > >         mf_params->packet_id =3D cpu_to_le32(*cookie);
>
> Agree with Arend's suggestion here. It is not correct to leave *cookie =
=3D 0 as it
> is and only assign a different packet_id while sending requst to firmware=
, because
> in that case the driver will not return the real cookie for this TX to cf=
g80211.
> Driver should assign the generated ID to *cookie and then copy that into =
packet_id.

Fixed

>
>
> Gokul
>
> > > >       memcpy(mf_params->data, &buf[DOT11_MGMT_HDR_LEN],
> > > >              le16_to_cpu(mf_params->len));
> > > >
> > > Regards,
> > > Arend

Regards,
Bogdan
