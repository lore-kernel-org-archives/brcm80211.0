Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4C3AE713
	for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583077; cv=pass; b=Z6Jm6lg2RvfN2uUkECeuQ/w/MsftLm0bqDduN9nSB7bT1pQPJHxHh7oVwMKREVNo8oL8GPzkPDPZy3zU8NpNaoi51uglXnktv4pv5g0e5/QmzZWScQcpNBAfoIMVl+lBLB1fKFaUnIzI2q0GPDsNfarXvtRkA/IHymN63GAOaBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583077; c=relaxed/simple;
	bh=LyVE2RfK4OPyFdZqMYkgAm8eoo2PwftW/lLocRBSoYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U79OWld8OsXDnEadBumO1E9cMvBfmpfeRbD4wUtvAKC3fX4VA2Bvk5OMUPRDCFxIVDLVgFaN82IGoUVC49JVn/s7E2r0Xt4B7jd9RyDK3jtVE2Z+YOCEWF9BeZSRLs9UnrKNi1WVVSWRxMFL9o/PM7Vio8bIRvfc5MBE7DXxjfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPIuL7hb; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPIuL7hb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698c1df9651so1550927a12.0
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 14:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784583075; cv=none;
        d=google.com; s=arc-20260327;
        b=LQWaufc1gTkzHyXc7Dj3twfN2+5VEt5T3Yat5/JrOG7F70Yi1Vh/U/UidP/rSEllX2
         YbUDOfCallfE6pPlxGDo2RPF1yhhfCyhv1aIR+A55nJ5qrVw3AtquUBi//B2ARLWOmaO
         7jvCqpWSNE/iAG7LC9OAKFp+uSI58LR2+Nqp4RLJDIRtehv5TdPWREfnQ/H0OJNesKVI
         uArZpqXycwA9YIPXBgbUdpdTIgSroBKm7tpa9Fb6hnsZ383Dc1tE9lJnaBdXPYGBfTIO
         J3mfIrX7eyHuloBuiqviBVuTf2Xdb50IifycWFNgcYl5ZiO16UKEBIIJadeNH69/UVgx
         Hf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNwA6ao6NzwbPSAsYgBOx8qGkJlRMW3TZGLPQCknqik=;
        fh=1KA32qv5hvdTQsBTZW32jjxxBcMPIKBzIa27P93GjjE=;
        b=hS766DcJxrtM99TnPyMyUvacLpiWPZx/XyNKKIwos0RGtag1uO64hKKgGzYKohPIbX
         YM6MyrhJYAyzSFAwcysAxAFIcVQ0RQiwam2eF7+K4F06VKwBOeca7DA6sCc2nBoAE4pR
         EcV8HjLJW3CUTysfCXG0RpoeSKsfwws44fvcZqHtEk+rgGPF6tqvOhhWkwiC0Jq4ksd0
         1txqXbjFqOVtfIKjfPDfVv39HSkZaPTccjcG6AXi/eCSdAnFBYIwRCUB3ELNYHzffnvX
         zamPdYKrR4fwyUWRVU9+lJ93qkUoQd/3CjenZt69sLz9SzXqMjbMoaisIhwcZVDF3/JX
         Wb1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583075; x=1785187875; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNwA6ao6NzwbPSAsYgBOx8qGkJlRMW3TZGLPQCknqik=;
        b=PPIuL7hbiS+Su7trjZXLEupAdR7VxhbWQc98NrYlvhJooSEF8yXyT9IlAsRk/hLd8C
         UADN9dQWKc+v11FByeaM3X2YJNWSXjZkkLDis535LH0u11rKz4NPTuXbF8147arwzs98
         DkhtDlQDVNenjNhQCRiopkVRMmIey2017d+g/RExguo0Ic1AuxxxgNsZ4xqDSABm79QL
         cGgN3RAVjmyGKiVkYDBXoFsWd8mOKl6pxWOO1UYp5GIFLviiMYcWBZR9qxpUO9TeX68R
         aoHWcHKWwDX8lSafFsyuAYj59IHB4IiE2PxScXeARKBsgOn4xSpJ265iB77NqVus0MPZ
         IsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583075; x=1785187875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNwA6ao6NzwbPSAsYgBOx8qGkJlRMW3TZGLPQCknqik=;
        b=qJds8qaXkX9A4A46i4Ret/4MuRu3boHR5+uaUa+YXAy+1HtegMxKIqbK37/dqjaU/K
         em9XH7OomFg4YRlwzs4KRkiwhcnwrqHq5R+IZyv6dJ1yQSHqOCNmU/tnfE4wNBOA3cFy
         a6qaDbpEYPGCOEgxztRdo1+6sOFjEWp5Ag1TjT5AxlPehMdGpBt3HW0Ix2Cshsq3wjS4
         n7WHV/iOtA10xXIW4ofKu3wgi8K7ZW477DtXF+ENSXDLC2L4OS1/J9TdInc1+gU4ibeo
         5P2huGVhc+4cRKUXHpsl7xqI1CnrXSrq18WiXcSy+5dbGvHHQBo7EIcoskSPp32mPtiv
         vy9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpbWSNAf+3R8gP/FGuGfHINTMDQo88yvFPSMFr+mMs34h+ZgiZ/Mqj+7dCMUasJGEErQWD1emYpJ0I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5OCLiZoK/k1SBG14M+u1xAH2i/L+C32Yw4kYCPef/8YNhpRfv
	D6Ln7m91ytATpHn0o2YHbPW6qODQfzU5W6e17A6kpAgw+FiwixetrWChNFfZOv+cViKMqhHszjN
	lejgkEWPXxPS0Ha0QLaTGDQPFP0ZLFT12pg==
X-Gm-Gg: AR+sD10+kVWqJMp5WchcumGXx4VIhhSFa6GA033oY/F1c2ZMxbD9hCTw5x/TEA7qAAp
	WsKfGnuC8nn0GEP3dRvrhvxhwCzvjROBb5YYbt+cw+zQYmYLkkRh/fVlno6dL5jUmMur9WXgTKT
	hIz9IlCFyCxu8a7UNug4QUPcCOIvBYwnIU1xANq7WvBBrA8gbJEoKk2BBCIUILnHgq+2GsUWBZZ
	mKrqShis65O0FYp8iphdf6JHqkjPwiCn2/Qz4NWAIQFazT12CSvG6ZfXReo2Hz2kOBmRslfXEtL
	/Gon/9tWMIHQyw1E9c+F31zD9vitToffozvWjYoqF/yLUzqizr+Hz1QBtIe0IA==
X-Received: by 2002:a05:6402:360f:b0:69e:1246:a86a with SMTP id
 4fb4d7f45d1cf-69e65164544mr3489726a12.0.1784583074543; Mon, 20 Jul 2026
 14:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714150423.53960-1-bogdan.nicolae@gmail.com> <20260720194900.2356442-2-arend.vanspriel@broadcom.com>
In-Reply-To: <20260720194900.2356442-2-arend.vanspriel@broadcom.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Mon, 20 Jul 2026 16:30:45 -0500
X-Gm-Features: AUfX_mwDL3jRFZM-mHkbrMM7Nz61SmsjwFBr2eIOv9ZsHK2PbNfTWiOWo4cXzOE
Message-ID: <CA+ORkNQcUjZ7ufoR5ULN8UDTzxXccFcmD8=rYe=UWVV3-M15Ug@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arend,

Sounds good. Do you prefer two patches in a single email or two separate em=
ails?

Best,
Bogdan

On Mon, Jul 20, 2026 at 2:49=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Tue, 14 Jul 2026, bogdan.nicolae@gmail.com wrote:
>
> > [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
>
> The code itself is correct, but there are process issues that need to be
> fixed before I can accept this:
>
> 1. This is a resubmission of the patch sent on 2026-07-09 [1]. A
>    resubmission must carry a version tag: the subject line should read
>    "[PATCH v2] wifi: brcmfmac: ..." not "[PATCH] wifi: brcmfmac: ...".
>
> 2. A v2 submission must include a "Changes in v2:" section below the ---
>    line documenting what changed from v1.
>
> 3. The From: address (bogdan.nicolae@gmail.com) does not match the
>    Signed-off-by address (bogdan.nicolae@acm.org). Please use a
>    consistent address or add a second Signed-off-by for the sending
>    address.
>
> 4. The patch addresses two independent issues: fixing the packet_id in
>    brcmf_cyw_mgmt_tx() (SAE auth frame TX) and fixing the zero-init and
>    PMKID copy in brcmf_cyw_external_auth() (auth completion). Please
>    split these into two separate patches.
>
> Please send a v2 addressing these points.
>
> [1] https://lore.kernel.org/linux-wireless/20260709122315.11400-1-bogdan.=
nicolae@gmail.com/
>
> Regards,
> Arend
