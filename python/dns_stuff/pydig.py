#!/usr/bin/env python
# Python program to mimic doing multiple dig commands in bash,
# and outputting the information parsed in an easy to read format.

# Written by David M Harris on 16 March 2024

import sys
import dns.resolver

# Take the domain as an argument or prompt for it.
try:
    domain_name = sys.argv[1]
except IndexError:
    domain_name = input ("Enter the domain to check: ")

# Print the header.
print (f"DNS for {domain_name}.")

# Print the A record(s) for the domain.
a_answers = dns.resolver.resolve(domain_name, 'A')
print ("A record(s):")
for rdata in a_answers:
    print(rdata.address)

# Print the SOA record for the domain.
soa_answers = dns.resolver.resolve(domain_name, 'SOA')
print ("\nSOA:")
for rdata in soa_answers:
    print(f' serial: {rdata.serial} | tech: {rdata.rname} | mname: {rdata.mname}')
    print(f' refresh: {rdata.refresh} | retry: {rdata.retry} | expire: {rdata.expire} | minimum: {rdata.minimum}')

# Print the nameservers for the domain with the related A record(s).
ns_answers = dns.resolver.resolve(domain_name, 'NS')
print("\nNameservers:")
for server in ns_answers:
    print(server.target)
    a_answers = dns.resolver.resolve(server.target, 'A')
    print ("A record(s):")
    for rdata2 in a_answers:
        print(rdata2.address)

# Print the MX records for the domain with the related A record(s).
mx_answers = dns.resolver.resolve(domain_name, 'MX',)
print ("\nMX:")
for rdata in mx_answers:
    print('Host', rdata.exchange, 'has preference', rdata.preference)
    a_answers = dns.resolver.resolve(rdata.exchange, 'A')
    print ("A record(s):")
    for rdata3 in a_answers:
        print(rdata3.address)

# Print the TXT record(s) for the domain.
txt_answers = dns.resolver.resolve(domain_name, 'TXT')
print ("\nTXT:")
for rdata in txt_answers:
    for txt_string in rdata.strings:
        print (' TXT:', txt_string)