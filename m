Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B131A291
	for <brcm80211@lists.linux.dev>; Sun, 23 Jun 2024 05:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719120892; cv=none; b=cYJtT+3L8VKviLgwS5kHhurGmm4pNp0hl+PGj4kTPaV2j1XoU5D+uZjoQ7/F+NnY1wNtxwGqVs4pRrLmx6BCQuAxklt0PRhWEz+0dtWi6c7R5cyX0qKSX60K7wDENp/bgJpjdA+FSv+4R7JaGQ5AkszvbTRMg8Zn6s7LsMb6V2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719120892; c=relaxed/simple;
	bh=4atl6EP5wZDD2hPrkFmQagIG36SanB0g6UV5MxUSve8=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XDC+1a4lPsaN+W+6Fn2/aT2zENFijJCYLWe3O01OnEGkC/a2QkX5KAHbO4YxC56BY7OIRFmUsVZe80H6slVadslCzCHL1pkFaQbI3Leek+xzt0MytNaSR9Bsr/TyG2TfSJ1AHLSYs2vaMlWYpLiSLSYovVWW+pFk1jiex0BcT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MR8Jz2X4; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MR8Jz2X4"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a724e067017so7041066b.0
        for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1719120889; x=1719725689; darn=lists.linux.dev;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9b6SYx3TQMuZiXHzm20e/V+xjxNmeGvMOb18gT8eQl0=;
        b=MR8Jz2X4gHbQ7PuxmW7Oz45gASRiN1f4Ac7dFnTsgkeE6nFS5BK12J92DTKt/MgXUs
         +GMv+kOxMxXEFkCeUQp74n6ODJAcZK/os2WWaJdvUOoSC72JiTHClLdd+L8709aiNr/C
         Mow78SHmh1bSmS6+WQ36fIAowgOJNXzwZPVP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719120889; x=1719725689;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b6SYx3TQMuZiXHzm20e/V+xjxNmeGvMOb18gT8eQl0=;
        b=XbFHkAHeQX9gvu+1EoEAQ5f7MuGUIqsoVL5C7xDRvRCzsQ0PsweZfOQDIQq2IrOJSa
         j6DAg6ynQbgoiiqgFas5NdxaB3CpT4bUzDyG/RsdWfBv6GZyN7uTWz8bbth46nn1Pzd+
         qMdf5NhgqJg6jBBVT9n0dCdYEWoXRdVgp9OWKOzVGW1VCglyxKYrqdlUYh/ayT43Asne
         iVk+EkpkVFabjP2kAcos3inQsOA2wfoLRpfiUepfSvzg6+0Khdg1U2FYkDGrdDl0LcuJ
         xi1ow2vNXibKhEw8eF165AShlyj6Nef4biOiv/BqyySx7rUyzCPJjktHRsm1WOOglLFd
         IJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWxHxPeikwdkSg5RcuPA/uoPMA/8HEG/lh3962uFGdALLjJmDE7WnWWJ5gP0FKW+hYY9N0Cv10ICbDuyQIo/s0XDXDLeVN3C0D4
X-Gm-Message-State: AOJu0YyPlsiKpuXuo7Sixo4+0UjF7x7cMkVb9bkD5wA9mJ3dDuXai2bI
	BiYh2EUj/GI44xdaws5fE9QpoIBnFe/ClU5C/YwzBvKmNUq3rtY0eu/pOsIdgg==
X-Google-Smtp-Source: AGHT+IHIdK+dCnhdZWyrVWNnKJihHVRJbaCyti/YDfGpviNzy62DFJUdIAJDshq7fiw+ahJV051GiQ==
X-Received: by 2002:a17:906:5fcb:b0:a6f:4c90:7952 with SMTP id a640c23a62f3a-a7245b81173mr71630166b.36.1719120889434;
        Sat, 22 Jun 2024 22:34:49 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724a2fdd0fsm33220166b.32.2024.06.22.22.34.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Jun 2024 22:34:48 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jacobe Zang <jacobe.zang@wesion.com>, =?UTF-8?B?T25kxZllaiBKaXJtYW4=?= <megi@xff.cz>
CC: <kvalo@kernel.org>, <duoming@zju.edu.cn>, <bhelgaas@google.com>, <minipli@grsecurity.net>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <heiko@sntech.de>, Nick Xie <nick@khadas.com>, <efectn@protonmail.com>, <jagan@edgeble.ai>, <dsimic@manjaro.org>, <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Sun, 23 Jun 2024 07:34:48 +0200
Message-ID: <190439700c0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <TYZPR03MB700154AE39D44B8D166344BF80CB2@TYZPR03MB7001.apcprd03.prod.outlook.com>
References: <20240620020015.4021696-1-jacobe.zang@wesion.com>
 <20240620020015.4021696-4-jacobe.zang@wesion.com>
 <fro2xcwsnvbxmpszny6g2p36z4zwoq4kegmpvww4twxir5piez@a3c2nbwitmab>
 <TYZPR03MB700154AE39D44B8D166344BF80CB2@TYZPR03MB7001.apcprd03.prod.outlook.com>
User-Agent: AquaMail/1.51.3 (build: 105103473)
Subject: Re: [PATCH v1 3/3] net: wireless: brcmfmac: Add support for AP6275P
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f7fcab061b8805af"

--000000000000f7fcab061b8805af
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On June 23, 2024 4:21:46 AM Jacobe Zang <jacobe.zang@wesion.com> wrote:

>> Any reason to strip info about origin of the patch, my SoB and
>> present this work as your own?
>
> Sincerely express my apology to Ondrej. It's really my mistake. After 
> getting your permission if I could submit the patches. I jsut think if the 
> author and submitter is not the same person is strange so I changed it. 
> Next tiem I will avoid this mistake. Apologize again.
>
>
>> I sincerely hope this is just a rookie mistake so please carefully read
> the URL below:
>
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>
> Thanks for the guidance Arend. After reading the document I realized what a 
> stupid mistake I made.
>
> BTW I have another question, except the SoB of the real author, should I 
> also post the original link in commit message?

Not really necessary. You may if you think that it's useful. Always add 
your SoB and keep SoB tags present untouched.

Regards,
Arend




--000000000000f7fcab061b8805af
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
2Gzj3QNJRLsZu1TLyOyBBIr/BE7UiY3RabgRzknBGAPmzhS+fmyM8OtM5BYBsFBrSUFtZZO2p/tf
Nbc24J2zf2peoZ8MK+7WQqummYlOnz+FyDkA9EybeNMcS5C+xi/PAgMBAAGjggHdMIIB2TAOBgNV
HQ8BAf8EBAMCBaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYI
KwYBBQUHMAGGNWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24y
Y2EyMDIwME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqG
OGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3Js
MCcGA1UdEQQgMB6BHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYB
BQUHAwQwHwYDVR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFIikAXd8CEtv
ZbDflDRnf3tuStPuMA0GCSqGSIb3DQEBCwUAA4IBAQCdS5XCYx6k2GGZui9DlFsFm75khkqAU7rT
zBX04sJU1+B1wtgmWTVIzW7ugdtDZ4gzaV0S9xRhpDErjJaltxPbCylb1DEsLj+AIvBR34caW6ZG
sQk444t0HPb29HnWYj+OllIGMbdJWr0/P95ZrKk2bP24ub3ZP/8SyzrohfIba9WZKMq6g2nTLZE3
BtkeSGJx/8dy0h8YmRn+adOrxKXHxhSL8BNn8wsmIZyYWe6fRcBtO3Ks2DOLyHCdkoFlN8x9VUQF
N2ulEgqCbRKkx+qNirW86eF138lr1gRxzclu/38ko//MmkAYR/+hP3WnBll7zbpIt0jc9wyFkSqH
p8a1MYICbTCCAmkCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1z
YTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMTv1t
bpIzNUky46LXMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBGi8hU7JaXZ+44ZoQU
OVBaB8Q+bnFInDc354wmh205TzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yNDA2MjMwNTM0NDlaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEABSZTquadWtGVE3yyAc3Jf2IH7jhhtcrjHTwh
rnsrfiLBFK06CNYEP/wORCvyuv7Ro8Lg3ETGf8hs8mLzs+ed49FwGYjyy7raVf20Gd51k0RkVQjK
0gbuFtCmBnXFCR3NQRXGAszvVNhK/Q6hRg1hdrXneluNNmLjjk1g4rWh0NHypkdCKMDgVTWPji+4
VcaEPd8WDMLD5CSoK3b/txwnrOkBLpdvB6no9TuN+zKiDjtcGOneR7W5UU7JuMQPH/DhogjkKGRe
cxTlba8qEQOluF3VjvAgANEAUqWirROfplIxH4kiwrD5zIepcuaAPHbx3DnCsN2Myayk7VH4iNup
SQ==
--000000000000f7fcab061b8805af--
