Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9027816A953
	for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719064158; cv=none; b=AKNWgT5s/r1LyMB8nmUNpatkylwRFGbzJYgryj7upsd3A3bElLnRGu5J5t1cZcDlN1/wlM0Old0ky4fuCozGF+XOdeB5wFHD4Z9cdwn7YexIA8h/Aqmy7hfHmVUGBB8Sp99CJ/Wyyt9KEmZOZ5cPe0DnWL392lPc5E611qxt08k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719064158; c=relaxed/simple;
	bh=wXGXPDoATetFmUCYfnOb5cvf2z54iOuxWefKkIkvAzQ=;
	h=From:To:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=eSS71C5NamQ1lVWe8WODJ+jgjHbH1NsZOHn+vykCwm3xWGQJK7m7+5YV5hoQMALmO/79guVr14uoR44OwAn4oSM+oZp3eQ9//Y/bX2cm6O066w1G7ty9P/Lpxob/PCAZ16j18QfIg1CBXyMEXHnWXN683EIakrHW3UoY/0n0rz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HoGjwcpG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HoGjwcpG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d457357easo329762a12.3
        for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1719064155; x=1719668955; darn=lists.linux.dev;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WehtHVSa5cP+C0eu7O6hZJ/NZHgjiDoQpoZTezP7AGM=;
        b=HoGjwcpGkWiquwD5DLUGQpHDztZ6fxWC1sGMkUEV0+9pjvC5cbzGtfgulgANn1hxF9
         xp+KJQLblRTk3+KmRvi1qIEd56l/suoVHyYmfH9avnjGcHFlBzSb19HOywK0fYzqTfRF
         CDo4ec8r4lSNAvwZ6MLV3wJZ7/Xu49OUlqB4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064155; x=1719668955;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WehtHVSa5cP+C0eu7O6hZJ/NZHgjiDoQpoZTezP7AGM=;
        b=Q4jJqsav7hMyIys8YL/mVh7QRlRUNvPOOYUKS3Y3Xpef7Mce0BH5+Gi0w8uONccP1V
         FRcmf/bKj/1OdWzJAMkEiB9EAsFlEc8q2PoHfpBHy8Pd6vBB+xbY+EnHIidq7EQXhG5T
         kMaz8mfVBiDqrZYQldb99iNQq9F0KWeDYgfDr+vBYQmgegbnT3H+bqyu6XIhkJLY5oZi
         rH4qAw7CUf+v943nIllqQDPrAgqu8vRTwh9dBpg4hvbvwUrAdfhmUbJqFGsFIbmtovz6
         Bg1CpddHdz0ut8s3Zxt/OCWNksRiDwzG9Qs+5/8UdM1y6UyEmRE4xZUVoMSHwTTb6OhL
         56JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSLWYy5coGSj11Wh77cVdu6bIjoT4db9q5bNA62qPTFkmLbMEoHuS/7X1XuFSYM7zqPHmsLaDlLH7pm4OJlJKPHnnpro/Qoq5B
X-Gm-Message-State: AOJu0YwdHo9hvsSm9Qa7dwbff5wr6L0FHJ0x+GCFSAmVweDE3CDYuDfG
	B7DL27Zfsr6TPlB3NtI35MJmwr+5hSrPNMxVpK6NQ97RXp76QkmqZj/bDUYuLQ==
X-Google-Smtp-Source: AGHT+IGPCqk+WzkG0ojgGfSFW7HVqKNO3doKNlzqIBIpYOUMZqnBPia1VgzFi0LJe0NCVfVaDek6DQ==
X-Received: by 2002:a50:d79b:0:b0:57c:dbf6:931f with SMTP id 4fb4d7f45d1cf-57d4bd56bc0mr86578a12.5.1719064154826;
        Sat, 22 Jun 2024 06:49:14 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7cdesm2370630a12.7.2024.06.22.06.49.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Jun 2024 06:49:12 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Alex Bee <knaerzche@gmail.com>, Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Sat, 22 Jun 2024 15:49:13 +0200
Message-ID: <19040354ba8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <190402b87a8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <20240621225558.280462-1-knaerzche@gmail.com>
 <190402b87a8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
User-Agent: AquaMail/1.51.3 (build: 105103473)
Subject: Re: [PATCH] wifi: brcmfmac: of: Support interrupts-extended
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000528264061b7ad0c2"

--000000000000528264061b7ad0c2
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 22, 2024 3:38:32 PM Arend Van Spriel <arend.vanspriel@broadcom.com> 
wrote:

> On June 22, 2024 12:56:02 AM Alex Bee <knaerzche@gmail.com> wrote:
>
>> This "new" version of defining external interrupts is around for a very
>> long time now and supported and preferred by irq_of_parse_and_map
>> respectively of_irq_parse_one.
>>
>> Support it in brcmfmac as well by checking if either "interrupts" or
>> "interrupts-extended" property exists as indication if irq_of_parse_and_map
>> should be called.
>
> All very interesting, but why should we add code for something that is not
> specified in the bindings documentation?
>
> NAK (for now). Feel free to update the bindings document.

So looked up the interrupts-extended definition:

The "interrupts-extended" property is a special form; useful when a node needs
to reference multiple interrupt parents or a different interrupt parent than
the inherited one. Each entry in this property contains both the parent phandle
and the interrupt specifier.

Given that brcmfmac device will only have one interrupt item defined there 
is no need to use it. If someone can give a good argument to support it 
please chime in.

Regards,
Arend




--000000000000528264061b7ad0c2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQdwYJKoZIhvcNAQcCoIIQaDCCEGQCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3OMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVYwggQ+oAMCAQICDE79bW6SMzVJMuOi1zANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMTQzMjNaFw0yNTA5MTAxMTQzMjNaMIGV
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEFyZW5kIFZhbiBTcHJpZWwxKzApBgkqhkiG
9w0BCQEWHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IB
DwAwggEKAoIBAQDxOB8Yu89pZLsG9Ic8ZY3uGibuv+NRsij+E70OMJQIwugrByyNq5xgH0BI22vJ
LT7VKCB6YJC88ewEFfYi3EKW/sn6RL16ImUM40beDmQ12WBquJRoxVNyoByNalmTOBNYR95ZQZJw
1nrzaoJtK0XIsv0dNCUcLlAc+jHkngD+I0ptVuWoMO1BcJexqJf5iX2M1CdC8PXTh9g4FIQnG2mc
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
bpIzNUky46LXMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBBq3OCm5fdgDacEIPU
vVemTSrOwrT9vm+LYXLbIZawDTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yNDA2MjIxMzQ5MTVaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAgbhfA4VDpfvD0V0a6SyDj1ZXcmDaWVGV+Q1p
jRO9ukQHOrCSQ4+WvbZU7/22Jb6cOgu4Z+a6PGaZniSPr+2QbsaGdo6L12tKuvcRdS3/QiyYbQHD
SdyZcJgLBR4VmppP4d8FnlQv3uB5dpzKcLHxO+VzpSR7R3r/dUJooUxnMktbZB+6M8Yz6od/GCwr
QD3ezEA3jaru/SyhwtkQBMLzsZwmrtKslL6xEXrgNW/CzpjNbc28fVZ9n17qCJoZ5bwdoV5Et3x5
R/i2kkANrcz56oY0SwWrGLvXHT21i8Dsspf5ysSCpnrICk2u4qCYRzyrRDEsauIojlhYf8tGMFX0
Pw==
--000000000000528264061b7ad0c2--
