Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023E1C2A8
	for <brcm80211@lists.linux.dev>; Sun,  7 Jul 2024 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720358463; cv=none; b=JISRS9rwyVJ2rs8s00Z3aCQvf3s01el8gOGGDjzvFrmpdi0aLC0ud9D8vmuyNp5hgweeFSZsoN/6rTr9WFTaGaAEV/D4d7X46JTWLXtg3M56MF0whM8swWhJJBq7c/0DGMurHUojc6FCAm3ZsjI8TkaNjKasFm3rkd8u3tGllr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720358463; c=relaxed/simple;
	bh=GVAD09BJfjBDhHO6paa1jYZZmYd1d7I5ljU5wa7tHdw=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=bozxOKFH0J2KVlBbW3qAod+uvOgXYOV501IHljuQPm5LrBXDuo2dMucRuJqU3I4Gcjt83Qicn6GzPZB3NCj6WasCiGC0Ze+f2AgeNC8WHxu+Yg/o0aIxhLe+wZHpq0hxwu+RMNztu6RZk/d5us2EUDqynjWqnfnUxKTXoEK6Uvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cGKsjiCK; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cGKsjiCK"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-79ef72bb8c8so100962485a.2
        for <brcm80211@lists.linux.dev>; Sun, 07 Jul 2024 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1720358460; x=1720963260; darn=lists.linux.dev;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBinUXggcao4S50ld2SCz87cVxkqbon3QT6/LewKoB8=;
        b=cGKsjiCKyZytw9sYUf7R6iKgnkKKNrUdZLb0qyPuGoQr6H6LA3Z6HpuP9C261Pxo3t
         YZ5cg33VNCa/nZ9dC6ENPdurgbnyfeY706rGc+3kSsA4M4YUImnXNhfjE71D4kqF7gEI
         MnPx5Tfmelm2ZgE28qAalN63GkpMVJhn6LKW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720358460; x=1720963260;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBinUXggcao4S50ld2SCz87cVxkqbon3QT6/LewKoB8=;
        b=slvCmxFZjr6vUlDu6SfrmomAvVPuFpFIY63bv5lE3fT19n02zjGuCeDPp4CMboovYc
         n2jTmhEy/eGbVm57D1Vgbq1GUG6RkDROsO3iRFSOvFnch8EBdEq7YRCofpLTrES25E5y
         TF8W/BgZRt5A5ZDbuvbJsmOXzfRPQ8FlRKN51o1a10VufZYwAPHjC5iRWBzTy6NM07QE
         iiHPIsgIJpieRPjhnBSRLz0VJp87YJJMRnPRBTa5tC8+eRv+ha5S7pZfFvvd7nGO8eXY
         vrUKgLwGBL8luKjoggfQoOoArRXhmTfq4pwKpDpUJ5YD8vjQdKEwII0HOqpf7Exkkk+N
         YVzg==
X-Forwarded-Encrypted: i=1; AJvYcCV9+s875s5f05nrulqerYT3X1krtGvG+H6ALPP/j27g3bWo5hJo08mQqWpkZ9VUmZpzvsi7mb/dzaXu36N9FF8+4WzY9w8O9KrE
X-Gm-Message-State: AOJu0YxxBrV5n1nQqriUq4DrOSSdtB0GiLGAq71S7nygHqFm7lOe2w0Z
	kM66ZbsRI5PqG5wH89WcozTokL+yqCrtBC8SN0ugltcXCwxSrBaJPmb8h66Xfg==
X-Google-Smtp-Source: AGHT+IG/STpxsa45sn5AC59ce0poqLTmyBrR4hBZIDiOhHSnJmKIh3rUUfOuFnml9+53zUk362XKAg==
X-Received: by 2002:a05:6214:529c:b0:6b5:46bf:be21 with SMTP id 6a1803df08f44-6b5ecfa2091mr109534726d6.21.1720358460278;
        Sun, 07 Jul 2024 06:21:00 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5e5154bcfsm41962606d6.129.2024.07.07.06.20.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jul 2024 06:20:59 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Nikolay Nikolov <dobrev666@gmail.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <nikolay.nikolov@bench.com>
Date: Sun, 07 Jul 2024 15:20:56 +0200
Message-ID: <1908d5acac0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1c6684f6-d3a8-4eaa-842d-c21fa2dd81c1@gmail.com>
References: <1c6684f6-d3a8-4eaa-842d-c21fa2dd81c1@gmail.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH 1/1] wifi: brcm80211: brcmfmac: Prevent sdio bus going to sleep while transfering data
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000edebf1061ca82a4d"

--000000000000edebf1061ca82a4d
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On July 7, 2024 2:22:49 PM Nikolay Nikolov <dobrev666@gmail.com> wrote:

> Use mutex to prevent sdio bus to be put to sleep by the sdio_bus_watchdog
> while sdio dataworker handles sdio_dpc data transfers.

Any reason for sending 3 identical patches within the hour.

As to the patch itself I would like to know if there is a reported issue 
being fixed here. What is the motivation behind this patch. Looking at the 
code I do not think the mutex is needed so please elaborate.

Regards,
Arend

> Signed-off-by: Nikolay Nikolov <nikolay.nikolov@bench.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 6 ++++++
>  1 file changed, 6 insertions(+)



--000000000000edebf1061ca82a4d
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
bpIzNUky46LXMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCDXkOCsR4ezlJlImWjh
bBWZnlYFsjWnpSH5HXXMIoGVyTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yNDA3MDcxMzIxMDBaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAxTwfk4hEQdIqXwVHiRfXMgZibHBJoSpmqcXp
MqHGz6G6wq7n/3GL6YxDYsrC+az19S2OJ7ZvUXowqjZHIQe1u/tTB5FkJLxorS1uQezrGupNK7/4
YHPmehIdtyEfPwSQIkVSbrtL8pLxmEHM3ruh0Yo4vp5AewLuIdMbd9hrcXzcMbAgPycmWDrktJyw
BHDZjbGHp4I4dUDgFus7PtOvAjRfzn7Vo11GPhxXmEEqXO47mQBaniqJSNrab1ohFDzF7oBeb92F
9y5yj5G3qQzfppEBkn8YQjTKOkbhAidW4srmVaEx59bKZQ2s7TGkcRarWiSy2iwzxAh2NGK0Kypp
zA==
--000000000000edebf1061ca82a4d--
