Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732E3DA5C8
	for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012238; cv=pass; b=qTvp3TD8oqtuntISW1x6onfXtv7bZQSUy40PuCzIvJi+I65mDaqIhTLWreIBI9CqAzUSzHQXFDVurFNhuipuDFUPF6l5KBiYQoCTq4liUngN+TKJN0CtEJXl2LNOC5A1BRa+ExzoH73rIoBZHDYBB7lHwnEgHRvSh1v3gyoSnFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012238; c=relaxed/simple;
	bh=sYhPPrA+LEyGe10v/9S9iujhzySyqoZg304AA5V99f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3ZoA9YTx3LkT2ucpyiBXtQKJ9xe5+EkGCIs8kd1YOiXzQuS8+yQmuPVdquc+Gug6LE7ztVuQROUjU90XKNwMsgFp6qnMoxdmrUpjcu3lJyLxjt57q+VDyK6jgN3cxJBMKP8iuahPG6QaqdPmwF/lijS8cjbVBwygvmZ5klvp7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3GYrVG/; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3GYrVG/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69a33fb0031so683489a12.1
        for <brcm80211@lists.linux.dev>; Mon, 13 Jul 2026 23:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784012235; cv=none;
        d=google.com; s=arc-20260327;
        b=MjUcNHB4iI4RhwylzeNdPalcDoO7x6QtmtK6AVBbSPO8wJA7fVdwHkw41eF6ujmMh5
         pvu2phX2+EAu0cjgWLDp+HKZjFhJAUQVRFE3VOuPw33jcFeT+sOpGhYPUEnydCwn8fSB
         /oZ4XYl02SBzT5iXN9V5Hazr4tkCU9XrJgWeDtNFsLUCkEzOZbfQTF8iBDyY8eEXfA2J
         rmYQjR8lt5QvICta+yGKfR8zuiWf2Pj8Fzih8Cp0GN/6LNwQCYZzGe4Xdq2vzhFhiN0Z
         A4XNhzqDY5jy8KGBLUW0+vq1u9do8VuCEJB42SxCbmLzdtggQNsCwXJdhMo1d+6ckLNK
         k71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TWuc1W6rlFvxt2fRtmEwf0XG9lnKi5ioowfRSdvC5p4=;
        fh=/xqdOLLl5Cu1mzZNNY1bRb3VLTt6NEoH3sIQ7fXR5tE=;
        b=pUKkKO+Sjvb7OaBXeKe+0E91nT+TXUyvbeOdykJaUFlWj5T8k1Vr/C/htozq/AM9LP
         2VMnwwvta2L8SnKO9Wt72LuoCTWwQYCkaWEG2Rzw23ygPc72hmDbF1wUQBdpsmNR3NO6
         Qn878v4/7rqlpPc0lpyJyoddA73CC3bQbZjfrIrIdRywY9/pAya2OjhlffQDBxOJbcP3
         pHJDovZxZXyN6Sj8WZ/ghdPeF2C++TnyEHYDVMrnvw1jgJnkAt4uc6po9h1V2opoX4Fd
         cMtmCj+98sxHmf3faJV8p3ZsePpDLXtyyoQy74xLndqTcFZ0wFbvKpRkjgWX+sqf1xIr
         UXHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784012235; x=1784617035; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TWuc1W6rlFvxt2fRtmEwf0XG9lnKi5ioowfRSdvC5p4=;
        b=T3GYrVG/uHOij2JZSD2WoW6sfOp6LAYw25xFbnDXLpiu1cdF6erePgxozVh28HC9PX
         ukmjABVazSfOz+YKJuJPqYzG1GNSa8ms9fLk8Ji38PDOwFIybqjRxOecc9pLrSXshENC
         bzd1poYysDnwV5nREd8YPDVvYnI/RpWTLZrLBwQL0+fiXffceBQbh/OMYb39qTRXt8tt
         rS9SaouutZGtDvjtMI0sIwnqLORLLqcmRJVasjSKaBQj/rq8fJNpZ10cmWPtnqIR3+kW
         M910bXjKIwI8Xd+qm5NZ2fvRPri9fF4t+wd7nUan/yLRDuv6Sv0OqHbPFgbTjQDElvum
         ZZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012235; x=1784617035;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWuc1W6rlFvxt2fRtmEwf0XG9lnKi5ioowfRSdvC5p4=;
        b=q96eUMy4w4EqdGR7uPr8JiszXo4TMgxS6EelgIJuuGhVaOfMt41/0wYtUUKHd/9ahu
         vHhSeytb9hlydgtorhEWtMc13EdipFJ0ZsTfVpAOOBEkaOhxXo4q7thsfaPgjoUXlvTv
         obStnsi2gSph5YFe9PtPjacgSswBlOjwzeZGMKJajzZ+bL/4VjMzN9nJoGRtR+lhY7Oh
         pYBcb0X2KCRp2CMLePEmjGM8LWOiz0eJlFpZB0YZeyoGB+JRq0FTHcpr6poocxvlhryX
         H85MiBaDsw3zjMOXY94I/5M/zTEkuYxyxN7LAvHkR81/5rG24qA/ZcT/AQVxkUC+Vnl7
         Agng==
X-Forwarded-Encrypted: i=1; AHgh+RrS58Yf9nwOlcXvh0y7TWNMz8Lv7KVcXANrlMvdsT/9ghJ7IjyZthbqBOVUOhleTs9lRNMrOhjs/KE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz70yhFZtvCJpdeH1t0bYb0qEEqHW9FXSCWHmPV0ZmgiV8iOLKX
	rPNUJ79VJ1kWodIco2Ai/evLBXFFxlGbcwkzZmtT+rjlP7buf4K4iMVNDwb3Yh+j2NkgGyRdf0L
	zTWxOBZnYYBKs1cvae/mEVQZ5y+1vvvY=
X-Gm-Gg: AfdE7cklaPa6qWe9+MTnXtyLl+acZDeARr3+f3/pOlmLcUE4O+Tiim+Kd+8q4ZWZfCl
	BIXP8Icv3MlK4UAhNI0KzVMLTSaQub0q7bdnmfhxyV6TCh8FNhlastixnnxT2x6v4efzEY8KyPD
	I5wM6JRppKabmwH/wWF17iWja6WAcjjZieu2MjAqKBg9C14UzcBbnQA0BGzkpEy/5zziMOGY8oq
	4pBXDeiz56T0ytOwi4m5D7O2PZ75kL3YvS5QzpIwDeNVhcEwVHJIIgPyHmTMYALljS2U3W9b+FB
	I/zsepY9JdlX65m8qP8Ke2jT7h7zNU0MDT3J56+g1xW0sBtcgYYOVopcwMUWVWGnFpGzUnc=
X-Received: by 2002:a05:6402:a50f:20b0:69c:799d:125d with SMTP id
 4fb4d7f45d1cf-69c799d174emr1419094a12.8.1784012235125; Mon, 13 Jul 2026
 23:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709122315.11400-1-bogdan.nicolae@gmail.com> <99c2c345-c594-46e1-b48a-de7f6e52e1c6@broadcom.com>
In-Reply-To: <99c2c345-c594-46e1-b48a-de7f6e52e1c6@broadcom.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Tue, 14 Jul 2026 01:56:47 -0500
X-Gm-Features: AUfX_mwK4Gri8h9h1CHY-X_flEhORWH-Kdw7WVbunTKwsx3Kedyrp4QrSRTfomo
Message-ID: <CA+ORkNTNytDi56RJbWHoFXLR2mSAgosz4UxHPgEvCBojmaFOdw@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	Bogdan Nicolae <bogdan.nicolae@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arend,

The code already sets *cookie=3D0 in the beginning, which according to
my understanding tells the driver it does not require async tracking
upstream. This is correct, because the function calls
wait_for_completion_timeout, so mgmt tx completes by the time we exit
the function and doesn't need to be tracked upstream. However, while
we are waiting for mgmt tx to finish, the firmware may generate
non-matching completion events captured by notify_mgmt_tx_status.
That's why setting a non-zero packed_id (sent to and returned by
firmware as part of a completion event) and checking against
vif->mgmt_tx_id is important.

Cheers,
Bogdan

On Sun, Jul 12, 2026 at 5:30=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 09/07/2026 14:23, Bogdan Nicolae wrote:
> > Avoid setting packet_id to cookie, which is always 0. Instead, use an
> > increasing atomic counter. Avoids mismatches of completion events later
> > in brcmf_notify_mgmt_tx_status, where packet_id !=3D vif->mgmt_tx_id is
> > checked.
> >
> > Also, zero out auth_status on initialization. Otherwise, garbage will
> > leak from the stack to the firmware (when bssid is less than 32 bytes
> > and/or when params->pmkid is set). Then, pass the params->pmkid to the
> > firmware (without it, the firmware caches a garbage PMKID on successful
> > authentication and denies a subsequent association request that include=
s
> > the PMKID).
> >
> > Signed-off-by: Bogdan Nicolae <bogdan.nicolae@acm.org>
>
> I always get a bit confused when people use different email addresses to
> send and sign-off patches.
>    > ---
> >   .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c   | 8 ++++++-=
-
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.=
c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > index ce09d44fa..cca53ff19 100644
> > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > @@ -23,6 +23,8 @@
> >   #define MGMT_AUTH_FRAME_DWELL_TIME  4000
> >   #define MGMT_AUTH_FRAME_WAIT_TIME   (MGMT_AUTH_FRAME_DWELL_TIME + 100=
)
> >
> > +static atomic_t brcmf_cyw_mgmt_tx_id =3D ATOMIC_INIT(0);
> > +
> >   static int brcmf_cyw_set_sae_pwd(struct brcmf_if *ifp,
> >                                struct cfg80211_crypto_settings *crypto)
> >   {
> > @@ -155,7 +157,7 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, struct w=
ireless_dev *wdev,
> >
> >       memcpy(&mf_params->da[0], &mgmt->da[0], ETH_ALEN);
> >       memcpy(&mf_params->bssid[0], &mgmt->bssid[0], ETH_ALEN);
> > -     mf_params->packet_id =3D cpu_to_le32(*cookie);
> > +     mf_params->packet_id =3D cpu_to_le32(atomic_inc_return(&brcmf_cyw=
_mgmt_tx_id));
>
> As I understand things the cookie value here is an output parameter. The
> driver should assign it:
>
> +       *cookie =3D atomic_inc_return(&brcmf_cyw_mgmt_tx_id);
>         mf_params->packet_id =3D cpu_to_le32(*cookie);
>
> >       memcpy(mf_params->data, &buf[DOT11_MGMT_HDR_LEN],
> >              le16_to_cpu(mf_params->len));
> >
> Regards,
> Arend
